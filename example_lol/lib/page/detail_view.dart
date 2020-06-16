import 'dart:ui';

import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vertical_card_pager_example/constant/constant.dart';
import 'package:vertical_card_pager_example/model/champion.dart';

class DetailView extends StatefulWidget {
  final Champion champion;

  const DetailView({this.champion});

  @override
  _DetailViewState createState() => _DetailViewState(champion: champion);
}

class _DetailViewState extends State<DetailView> with TickerProviderStateMixin {
  final Champion champion;

  _DetailViewState({this.champion});

  bool init = false;

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    Tween<double> tween = Tween(begin: 0.0, end: 400.0);

    animation = tween
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInExpo))
          ..addListener(() {
            setState(() {});
          });

    controller.forward();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        init = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgoundColor,
      body: Stack(children: [
        Hero(
          tag: champion.name.toUpperCase(),
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [backgoundColor, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              "images/${champion.name.toLowerCase()}_lol.gif",
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 5, top: 45),
            child: CustomBackButton()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                  width: double.infinity,
                  height: 320,
                  child: Stack(
                    children: [
                      AnimatedBorder(animation: animation),
                      Align(
                        alignment: Alignment.center,
                        child: AnimatedOpacity(
                          opacity: init ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "images/role/${champion.role.toString().split(".")[1].toLowerCase()}.png",
                                                width: 40,
                                                height: 40),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text("ROLE",
                                                style: textTheme.headline3),
                                            Text(
                                                champion.role
                                                    .toString()
                                                    .split(".")[1],
                                                style: textTheme.headline3
                                                    .copyWith(
                                                        color:
                                                            Color(0xffAE914B)))
                                          ]),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: 40,
                                            child: Center(
                                              child: DifficultyGraph(
                                                  count: widget.champion
                                                      .difficulty.index),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "DIFFICULTY",
                                            style: textTheme.headline3,
                                          ),
                                          Text(
                                              champion.difficulty
                                                  .toString()
                                                  .split(".")[1]
                                                  .toUpperCase(),
                                              style: textTheme.headline3
                                                  .copyWith(
                                                      color: Color(0xffAE914B)))
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: Divider(
                                      color: Colors.white,
                                      height: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 30),
                                    child: Text(champion.description,
                                        style: textTheme.bodyText1,
                                        maxLines: 6,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ]),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: init ? 1.0 : 0.0,
            child: Container(
              margin: EdgeInsets.only(bottom: 185),
              width: double.infinity,
              height: 270,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      champion.nickName,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      champion.name.toUpperCase(),
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          letterSpacing:
                              4 + 25 * ((400 - animation.value) / 400.0)),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}

class DifficultyGraph extends StatelessWidget {
  final count;
  const DifficultyGraph({this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Parallelogram(
        cutLength: 10.0,
        edge: Edge.RIGHT,
        child: Container(
          color: difficultyEnableColor,
          width: 25.0,
          height: 10.0,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 16),
        child: Parallelogram(
          cutLength: 10.0,
          edge: Edge.RIGHT,
          child: Container(
            color: count > 0 ? difficultyEnableColor : difficultyDisableColor,
            width: 25.0,
            height: 10.0,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 32),
        child: Parallelogram(
          cutLength: 10.0,
          edge: Edge.RIGHT,
          child: Container(
            color: count > 1 ? difficultyEnableColor : difficultyDisableColor,
            width: 25.0,
            height: 10.0,
          ),
        ),
      ),
    ]);
  }
}

class AnimatedBorder extends StatelessWidget {
  const AnimatedBorder({
    @required this.animation,
  });

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, snapshot) {
          return CustomPaint(
            painter: MyPainter(value: animation.value),
            child: Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            ),
          );
        },
      );
    });
  }
}

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.grey[100].withOpacity(0.3),
        child: InkWell(
          child: SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double value;

  MyPainter({this.value});

  final paintBorder = Paint()
    ..color = Colors.white30
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  final transparentBorder = Paint()
    ..color = Colors.transparent
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    if (value < 15) {
      double lineValue = size.width * value / 100;
      path.lineTo(lineValue, 0);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(size.width * 15 / 100, 0);
      canvas.drawPath(path, paintBorder);
    }

    path = Path();
    path.moveTo(size.width * 15 / 100, 0);

    if (value >= 15 && value <= 85) {
      double lineValue = size.width * value / 100;
      path.lineTo(lineValue, 0);
      canvas.drawPath(path, transparentBorder);
      return;
    } else {
      path.lineTo(size.width * 85 / 100, 0);
      canvas.drawPath(path, transparentBorder);
    }

    path = Path();
    path.moveTo(size.width * 85 / 100, 0);

    if (value > 85 && value < 100) {
      double lineValue = size.width * value / 100;
      path.lineTo(lineValue, 0);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(size.width, 0);
      canvas.drawPath(path, paintBorder);
    }

    if (value < 200) {
      double lineValue = size.height * (value - 100) / 100;
      path.lineTo(size.width, lineValue);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(size.width, size.height);
      canvas.drawPath(path, paintBorder);
    }

    path = Path();
    path.moveTo(size.width, size.height);

    if (value < 300) {
      double lineValue = size.width - size.width * (value - 200) / 100;
      path.lineTo(lineValue, size.height);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(0, size.height);
      canvas.drawPath(path, paintBorder);
    }

    path = Path();
    path.moveTo(0, size.height);

    if (value < 400) {
      double lineValue = size.height - size.height * (value - 300) / 100;
      path.lineTo(0, lineValue);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(0, 0);
      canvas.drawPath(path, paintBorder);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
