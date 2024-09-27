import 'package:flutter/material.dart';

void main() {
  runApp(
    //가장 기본, 최상위 앱
    const MaterialApp(
      //기본 앱을 쉽게 만들 수 있는 scaffold
      home: Scaffold(
        body: SafeArea(
          child: Text(
            'ffffigmasssaaabbb!',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}
