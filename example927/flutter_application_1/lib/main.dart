// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(
    //가장 기본, 최상위 앱
    MaterialApp(
      //기본 앱을 쉽게 만들 수 있는 scaffold
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is App bar!'),
          backgroundColor: Colors.lightBlue,
          actions: [
            IconButton(
              icon: Icon(
                Icons.home,
              ),
              onPressed: () => print('Hello Mango'),
            ),
          ],
        ),
        body: SafeArea(
          child: Text(
            'ffffigmasssaaabbb!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
            ),
          ),
        ),
      ),
    ),
  );
}
