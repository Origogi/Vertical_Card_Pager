
<div align="center">
    <img src="https://user-images.githubusercontent.com/35194820/84762308-9a672f00-b005-11ea-84e3-eefc6cf25cf5.png">
</a>
</div><br>

<div align="center">
	<a href="https://flutter.io">
    <img src="https://img.shields.io/badge/Platform-Flutter-yellow.svg"
      alt="Platform" />
  </a>
  <a href="https://pub.dev/packages/vertical_card_pager">
   <img src="https://img.shields.io/badge/pub-v1.5.0-blue" />
</a>

</div><br>

Use dynamic and beautiful card view pagers to help you create great apps.

## Preview

<div align="center">

<img src="https://user-images.githubusercontent.com/35194820/84666831-8b787200-af5c-11ea-9bce-653c00d556fe.gif" width="25%">
<img src="https://user-images.githubusercontent.com/35194820/84666824-89161800-af5c-11ea-898c-34b65e03f6c5.gif"  width="25%">
<img src="https://user-images.githubusercontent.com/35194820/84666830-8adfdb80-af5c-11ea-8383-878301d92179.gif"  width="25%">
</div>


<div align="center">

<img src="https://user-images.githubusercontent.com/35194820/84659970-2b310280-af53-11ea-9ba0-67fbf9a67639.gif" width="35%">

</div>

## New Feature

### v1.3.0

- Change Alignment

| Left | Center(Default) | Right |
|:--------:|:--------:|:--------:|
|![left](https://user-images.githubusercontent.com/35194820/87397350-2eb9b700-c5ef-11ea-8015-27901cbaa669.png)|![center](https://user-images.githubusercontent.com/35194820/87397353-2f524d80-c5ef-11ea-9bc5-7d4b6c72364d.png)|![right](https://user-images.githubusercontent.com/35194820/87397346-2ceff380-c5ef-11ea-88a1-d6e53612f9bc.png)|

### v1.4.0

- Enable Web

<div align="center">
<img src="https://user-images.githubusercontent.com/35194820/94888765-09816a00-04b5-11eb-9ecc-db68de687654.png">
</div>
<div align="center">
   <A href="https://origogi.github.io/Vertical_Card_Pager/#/">Web Link</A>
</div>


## Installing

1. Add dependency to `pubspec.yaml`

    *Get the latest version in the 'Installing' tab on pub.dartlang.org*

```dart
dependencies:
    vertical_card_pager: ^1.5.0
```

2. Import the package

```dart
import 'package:vertical_card_pager/vertical_card_pager.dart';
```

3. Adding `VerticalCardPager`

*With optional parameters*
```dart
  @override
  Widget build(BuildContext context) {
    final List<String> titles = ["RED", "YELLOW", "BLACK", "CYAN", "BLUE", "GREY", ];

    final List<Widget> images = [
      Container(
        color: Colors.red,
      ),
        Container(
        color: Colors.yellow,
      ),
        Container(
        color: Colors.black,
      ),
        Container(
        color: Colors.cyan,
      ),
        Container(
        color: Colors.blue,
      ),
        Container(
        color: Colors.grey,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  titles: titles,  // required
                  images: images,  // required
                  textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // optional
                  onPageChanged: (page) { // optional
                  },
                  onSelectedItem: (index) { // optional
                  },
                  initialPage: 0, // optional
                  align : ALIGN.CENTER // optional
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
```

## How to use

Check out the **example** app in the [example](example) directory or the 'Example' tab on pub.dartlang.org for a more complete example.

## Example

- [Color](example)

- [MacOS](example_macos)

- [Fashion](example_fashion)

- [League of Legend](example_lol)

### Example on Web

https://origogi.github.io/Vertical_Card_Pager/#/

## Reference

This package's animation is inspired from from this [Dribbble](https://dribbble.com/shots/5097519-California-National-Park-Guide?utm_source=Clipboard_Shot&utm_campaign=KEVINGAUTIER&utm_content=California%20National%20Park%20Guide&utm_medium=Social_Share) art.

## TODO

- [x] Make proto type
- [x] Add or Remove Item effect
- [x] Add round edge in each item view
- [x] Handle touch event
- [x] Deploy plug in
- [x] Add card alignment
