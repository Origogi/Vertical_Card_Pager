import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<String> titles = [
  "Catalina",
  "El Capitan",
  "High Sirera",
  "Mojave",
  "Sierra",
  "Yosemite",
];

final List<Widget> images = [
  ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset(
      "images/catalina.png",
      fit: BoxFit.cover,
    ),
  ),
  ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset(
      "images/el_capitan.png",
      fit: BoxFit.cover,
    ),
  ),
  ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset(
      "images/high_sierra.png",
      fit: BoxFit.cover,
    ),
  ),
  ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset(
      "images/mojave.png",
      fit: BoxFit.cover,
    ),
  ),
  ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset(
      "images/sierra.png",
      fit: BoxFit.cover,
    ),
  ),
  ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset(
      "images/yosemite.png",
      fit: BoxFit.cover,
    ),
  ),
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: VerticalCardPager(
                  textStyle: TextStyle(
                      fontFamily: "Bevan",
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  titles: titles,
                  images: images,
                  initialPage: 0,
                  onPageChanged: (page) {
                    // print(page);
                  },
                  onSelectedItem: (index) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
