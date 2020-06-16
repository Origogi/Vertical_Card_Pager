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
  "MEN",
  "WOMEN",
  "CHILD",
  "ACC.",
];

final List<Widget> images = [
  ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset(
      "images/men.jpg",
      fit: BoxFit.cover,
    ),
  ),
  ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset(
      "images/women.jpg",
      fit: BoxFit.cover,
    ),
  ),
  ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset(
      "images/children.jpg",
      fit: BoxFit.cover,
    ),
  ),
  ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset(
      "images/accessories.jpg",
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
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                  titles: titles,
                  images: images,
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
