// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My First App"),
      ),
      body: Text(
        "I am Sardar Ahmed Nazar, doing BS software engineering from UOH Haripur. I am a flutter developer.",
        //textDirection: TextDirection.ltr,
        //textAlign: TextAlign.center,
        //overflow: TextOverflow.ellipsis,
        //textScaleFactor: 4,
        //softWrap: true,
        //maxLines: 3,
      ),
    );
  }
}
