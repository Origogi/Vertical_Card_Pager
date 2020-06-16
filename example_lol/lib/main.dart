import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'constant/constant.dart';
import 'model/champion.dart';
import 'page/detail_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'lol',
        textTheme: textTheme,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<String> titles = [
  "AKALI",
  "CAMILE",
  "EZREAL",
  "IRELIA",
  "POPPY",
  "ZOE",
];

final List<Widget> images = [
  Hero(
    tag: "AKALI",
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.asset(
        "images/akali_lol.gif",
        fit: BoxFit.cover,
      ),
    ),
  ),
  Hero(
    tag: "CAMILE",
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.asset(
        "images/camile_lol.gif",
        fit: BoxFit.cover,
      ),
    ),
  ),
  Hero(
    tag: "EZREAL",
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.asset(
        "images/ezreal_lol.gif",
        fit: BoxFit.cover,
      ),
    ),
  ),
  Hero(
    tag: "IRELIA",
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.asset(
        "images/irelia_lol.gif",
        fit: BoxFit.cover,
      ),
    ),
  ),
  Hero(
    tag: "POPPY",
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.asset(
        "images/poppy_lol.gif",
        fit: BoxFit.cover,
      ),
    ),
  ),
  Hero(
    tag: "ZOE",
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.asset(
        "images/zoe_lol.gif",
        fit: BoxFit.cover,
      ),
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
            Container(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Center(
                    child: Image.asset(
                  "images/logo.png",
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  // textStyle: TextStyle(color : Colors.red),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {
                    // print(page);
                  },
                  onSelectedItem: (index) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailView(
                                champion:
                                    championsMap[titles[index].toLowerCase()],
                              )),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
