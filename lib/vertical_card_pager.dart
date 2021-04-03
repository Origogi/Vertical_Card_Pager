import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef PageChangedCallback = void Function(double? page);
typedef PageSelectedCallback = void Function(int index);

enum ALIGN { LEFT, CENTER, RIGHT }

class VerticalCardPager extends StatefulWidget {
  final List<String> titles;
  final List<Widget> images;
  final PageChangedCallback? onPageChanged;
  final PageSelectedCallback? onSelectedItem;
  final TextStyle? textStyle;
  final int initialPage;
  final ALIGN align;

  VerticalCardPager(
      {required this.titles,
      required this.images,
      this.onPageChanged,
      this.textStyle,
      this.initialPage = 2,
      this.onSelectedItem,
      this.align = ALIGN.CENTER})
      : assert(titles.length == images.length);

  @override
  _VerticalCardPagerState createState() => _VerticalCardPagerState();
}

class _VerticalCardPagerState extends State<VerticalCardPager> {
  bool isScrolling = false;
  double? currentPosition;
  PageController? controller;

  @override
  void initState() {
    super.initState();

    currentPosition = widget.initialPage.toDouble();
    controller = PageController(initialPage: widget.initialPage);

    controller!.addListener(() {
      setState(() {
        currentPosition = controller!.page;

        if (widget.onPageChanged != null) {
          Future(() => widget.onPageChanged!(currentPosition));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onVerticalDragEnd: (details) {
          isScrolling = false;
        },
        onVerticalDragStart: (details) {
          isScrolling = true;
        },
        onTapUp: (details) {
          if ((currentPosition! - currentPosition!.floor()).abs() <= 0.15) {
            int selectedIndex = onTapUp(
                context, constraints.maxHeight, constraints.maxWidth, details);

            if (selectedIndex == 2) {
              if (widget.onSelectedItem != null) {
                Future(() => widget.onSelectedItem!(currentPosition!.round()));
              }
            } else if (selectedIndex >= 0) {
              int goToPage = currentPosition!.toInt() + selectedIndex - 2;
              controller!.animateToPage(goToPage,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOutExpo);
            }
          }
        },
        child: Stack(
          children: [
            CardControllerWidget(
              titles: widget.titles,
              images: widget.images,
              textStyle: widget.textStyle,
              currentPostion: currentPosition,
              cardViewPagerHeight: constraints.maxHeight,
              cardViewPagerWidth: constraints.maxWidth,
              align: widget.align,
            ),
            Positioned.fill(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.images.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            )
          ],
        ),
      );
    });
  }

  int onTapUp(context, maxHeight, maxWidth, details) {
    final RenderBox box = context.findRenderObject();
    final Offset localOffset = box.globalToLocal(details.globalPosition);

    double dx = localOffset.dx;
    double dy = localOffset.dy;

    for (int i = 0; i < 5; i++) {
      double width = getWidth(maxHeight, i);
      double height = getHeight(maxHeight, i)!;
      double? left = getStartPositon(maxWidth, width);
      double top = getCardPositionTop(height, maxHeight, i);

      if (top <= dy && dy <= top + height) {
        if (left! <= dx && dx <= left + width) {
          return i;
        }
      }
    }
    return -1;
  }

  double? getStartPositon(cardViewPagerWidth, cardWidth) {
    double? position = 0;

    switch (widget.align) {
      case ALIGN.LEFT:
        position = 0;
        break;
      case ALIGN.CENTER:
        position = (cardViewPagerWidth / 2) - (cardWidth / 2);
        break;
      case ALIGN.RIGHT:
        position = cardViewPagerWidth - cardWidth;
        break;
    }

    return position;
  }

  double getWidth(maxHeight, i) {
    double cardMaxWidth = maxHeight / 2;
    return cardMaxWidth - 60 * (i - 2).abs();
  }

  double? getHeight(maxHeight, i) {
    double? cardMaxHeight = maxHeight / 2;

    if (i == 2) {
      return cardMaxHeight;
    } else if (i == 0 || i == 4) {
      return cardMaxHeight! - cardMaxHeight * (4 / 5) - 10;
    } else
      return cardMaxHeight! - cardMaxHeight * (4 / 5);
  }
}

double getCardPositionTop(double cardHeight, double viewHeight, int i) {
  int diff = (2 - i);
  int diffAbs = diff.abs();

  double basePosition = (viewHeight / 2) - (cardHeight / 2);
  double cardMaxHeight = viewHeight / 2;

  if (diffAbs == 0) {
    return basePosition;
  }
  if (diffAbs == 1) {
    if (diff >= 0) {
      return basePosition - (cardMaxHeight * (6 / 9));
    } else {
      return basePosition + (cardMaxHeight * (6 / 9));
    }
  } else {
    if (diff >= 0) {
      return basePosition - cardMaxHeight * (8 / 9);
    } else {
      return basePosition + cardMaxHeight * (8 / 9);
    }
  }
}

class CardControllerWidget extends StatelessWidget {
  final double? currentPostion;
  final double cardMaxWidth;
  final double cardMaxHeight;
  final double cardViewPagerHeight;
  final double? cardViewPagerWidth;
  final TextStyle? textStyle;
  final ALIGN? align;

  final List? titles;
  final List? images;

  CardControllerWidget(
      {this.titles,
      this.images,
      this.cardViewPagerWidth,
      required this.cardViewPagerHeight,
      this.currentPostion,
      this.align,
      this.textStyle})
      : cardMaxHeight = cardViewPagerHeight * (1 / 2),
        cardMaxWidth = cardViewPagerHeight * (1 / 2);

  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = [];

    var titleTextStyle;

    if (textStyle != null) {
      titleTextStyle = textStyle;
    } else {
      titleTextStyle = Theme.of(context).textTheme.headline1;
    }

    for (int i = 0; i < images!.length; i++) {
      var cardWidth = max(cardMaxWidth - 60 * (currentPostion! - i).abs(), 0.0);
      var cardHeight = getCardHeight(i);

      var cardTop = getTop(cardHeight, cardViewPagerHeight, i);

      Widget card = Positioned.directional(
        textDirection: TextDirection.ltr,
        top: cardTop,
        start: getStartPositon(cardWidth),
        child: Opacity(
          opacity: getOpacity(i),
          child: Container(
            width: cardWidth,
            height: cardHeight,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: images![i],
                ),
                Align(
                    child: Text(
                  titles![i],
                  style: titleTextStyle.copyWith(fontSize: getFontSize(i)),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          ),
        ),
      );

      cardList.add(card);
    }

    return Stack(
      children: cardList,
    );
  }

  double getOpacity(int i) {
    double diff = (currentPostion! - i);

    if (diff >= -2 && diff <= 2) {
      return 1.0;
    } else if (diff > -3 && diff < -2) {
      return 3 - diff.abs();
    } else if (diff > 2 && diff < 3) {
      return 3 - diff.abs();
    } else {
      return 0;
    }
  }

  double getTop(double cardHeight, double viewHeight, int i) {
    double diff = (currentPostion! - i);
    double diffAbs = diff.abs();

    double basePosition = (viewHeight / 2) - (cardHeight / 2);

    if (diffAbs == 0) {
      return basePosition;
    }
    if (diffAbs > 0.0 && diffAbs <= 1.0) {
      if (diff >= 0) {
        return basePosition - (cardMaxHeight * (6 / 9)) * diffAbs;
      } else {
        return basePosition + (cardMaxHeight * (6 / 9)) * diffAbs;
      }
    } else if (diffAbs > 1.0 && diffAbs < 2.0) {
      if (diff >= 0) {
        return basePosition -
            (cardMaxHeight * (6 / 9)) -
            cardMaxHeight * (2 / 9) * (diffAbs - diffAbs.floor()).abs();
      } else {
        return basePosition +
            (cardMaxHeight * (6 / 9)) +
            cardMaxHeight * (2 / 9) * (diffAbs - diffAbs.floor()).abs();
      }
    } else {
      if (diff >= 0) {
        return basePosition - cardMaxHeight * (8 / 9);
      } else {
        return basePosition + cardMaxHeight * (8 / 9);
      }
    }
  }

  double getCardHeight(int index) {
    double diff = (currentPostion! - index).abs();

    if (diff >= 0.0 && diff < 1.0) {
      return cardMaxHeight - cardMaxHeight * (4 / 5) * ((diff - diff.floor()));
    } else if (diff >= 1.0 && diff < 2.0) {
      return cardMaxHeight -
          cardMaxHeight * (4 / 5) -
          10 * ((diff - diff.floor()));
    } else {
      final height = cardMaxHeight -
          cardMaxHeight * (4 / 5) -
          10 -
          5 * ((diff - diff.floor()));

      return height > 0 ? height : 0;
    }
  }

  double getFontSize(int index) {
    double diffAbs = (currentPostion! - index).abs();
    diffAbs = num.parse(diffAbs.toStringAsFixed(2)) as double;

    double maxFontSize = 50;
    if (diffAbs >= 0.0 && diffAbs < 1.0) {
      if (diffAbs < 0.02) {
        diffAbs = 0;
      }

      return maxFontSize - 25 * ((diffAbs - diffAbs.floor()));
    } else if (diffAbs >= 1.0 && diffAbs < 2.0) {
      return maxFontSize - 25 - 5 * ((diffAbs - diffAbs.floor()));
    } else {
      final fontSize = maxFontSize - 30 - 15 * ((diffAbs - diffAbs.floor()));

      return fontSize > 0 ? fontSize : 0;
    }
  }

  double getStartPositon(cardWidth) {
    double position = 0;

    switch (align) {
      case ALIGN.LEFT:
        position = 0;
        break;
      case ALIGN.CENTER:
        position = (cardViewPagerWidth! / 2) - (cardWidth / 2);
        break;
      case ALIGN.RIGHT:
        position = cardViewPagerWidth! - cardWidth;
        break;
    }

    return position;
  }
}
