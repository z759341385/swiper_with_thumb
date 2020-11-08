/*
 * @Author: zhc
 * @Date: 2020-11-08 01:29:55
 * @LastEditTime: 2020-11-08 14:53:17
 * @Description: 
 * @LastEditors: zhc
 */
import 'package:flutter/material.dart';
import 'package:swiper_with_thumb/ThumbSwiper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Swiper with thumb example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Map> imageList = [
    {
      'type': 'network',
      'path':
          'https://img1.qunarzz.com/travel/d6/1701/c3/ad1a5ce13c3e2bb5.jpg?ver=1',
    },
    {
      'type': 'network',
      'path':
          'https://img1.qunarzz.com/travel/d8/1512/b3/0aa3d7eb52cd80f7.jpg_r_1360x1360x95_3ed3350c.jpg',
    },
    {
      'type': 'network',
      'path':
          'https://img1.qunarzz.com/travel/d6/1512/60/9a04f34cb80a2bf7.jpg_r_1360x1360x95_8ee9e53c.jpg',
    },
    {
      'type': 'network',
      'path':
          'https://img1.qunarzz.com/travel/d6/1701/c3/ad1a5ce13c3e2bb5.jpg?ver=1',
    },
    {
      'type': 'network',
      'path':
          'https://img1.qunarzz.com/travel/d8/1512/b3/0aa3d7eb52cd80f7.jpg_r_1360x1360x95_3ed3350c.jpg',
    },
    {
      'type': 'network',
      'path':
          'https://img1.qunarzz.com/travel/d6/1512/60/9a04f34cb80a2bf7.jpg_r_1360x1360x95_8ee9e53c.jpg',
    },
  ];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width:double.maxFinite,
          child: ThumbSwiper(
            imageList: imageList,
            height: 400,
            width: 200,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
