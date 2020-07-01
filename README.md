
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
   <img src="https://img.shields.io/badge/pub-v1.1.0-blue" />
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

## Installing

1. Add dependency to `pubspec.yaml`

    *Get the latest version in the 'Installing' tab on pub.dartlang.org*

```dart
dependencies:
    vertical_card_pager: ^1.1.1
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
                  textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {
                  },
                  onSelectedItem: (index) {
                  },
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

### Example

- [Color](example)

- [MacOS](example_macos)

- [Fashion](example_fashion)

- [League of Legend](example_lol)

## Reference

This package's animation is inspired from from this [Dribbble](https://dribbble.com/shots/5097519-California-National-Park-Guide?utm_source=Clipboard_Shot&utm_campaign=KEVINGAUTIER&utm_content=California%20National%20Park%20Guide&utm_medium=Social_Share) art.

## TODO

- [x] Make proto type
- [x] Add or Remove Item effect
- [x] Add round edge in each item view
- [x] Handle touch event
- [x] Deploy plug in
- [x] Support Web  
