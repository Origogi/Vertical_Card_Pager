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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final champions = championsMap.values.toList();

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
                  titles: champions.map((e) => e.name.toUpperCase()).toList(),
                  images: champions
                      .map((e) => Hero(
                            tag: e.name.toUpperCase(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                e.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                  onPageChanged: (page) {},
                  onSelectedItem: (index) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailView(
                                champion: champions[index],
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
