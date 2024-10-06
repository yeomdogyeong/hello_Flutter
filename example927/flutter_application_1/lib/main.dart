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
          body: AlignContainer()
          // SafeArea(
          //   child: Text(
          //     'ffffigmasssaaabbb!',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 32,
          //     ),
          //   ),
          // ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () => print('hey!'),
          //   child: Icon(Icons.bug_report),
          // ),
          ),
    ),
  );
}

class TestStateLess extends StatelessWidget {
  const TestStateLess({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //컨테이너는 기본적으로 child를 가질 수 있음
        width: 200,
        height: 200,
        padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
        decoration: BoxDecoration(
          color: Colors.purple.shade200,
        ),
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Center(
          child: Container(
            color: Colors.white,
            child: Text('Hello Container'),
          ),
        ),
      ),
    );
  }
}

class AlignContainer extends StatelessWidget {
  const AlignContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey,
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
          ),
          Container(
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }
}
