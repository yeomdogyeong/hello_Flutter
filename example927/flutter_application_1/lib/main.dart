// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(
    //가장 기본, 최상위 앱
    MaterialApp(
      //기본 앱을 쉽게 만들 수 있는 scaffold
      home: Scaffold(
          appBar: AppBar(
            title: Text('Hi DG!'),
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
          body: Ratio()
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

//container를 배치
class TestStateLess extends StatelessWidget {
  const TestStateLess({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          //컨테이너는 기본적으로 child를 가질 수 있음
          width: 100,
          height: 100,
          padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
          decoration: BoxDecoration(
            color: Colors.purple.shade200,
          ),
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Center(
            child: Container(
              color: Colors.white,
              child: Text('bb Container'),
            ),
          ),
        ),
        Center(
          child: Container(
            //컨테이너는 기본적으로 child를 가질 수 있음
            width: 100,
            height: 100,
            padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
            decoration: BoxDecoration(
              color: Colors.purple.shade200,
            ),
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Center(
              child: Container(
                color: Colors.white,
                child: Text('bb Container'),
              ),
            ),
          ),
        ),
      ],
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
      color: const Color.fromARGB(255, 155, 101, 101),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            child: Text('hi'),
            color: Colors.red,
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

//비율로 배치하기
class Ratio extends StatelessWidget {
  const Ratio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      //위젯으로 감싸고 flexible 적용
      children: [
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.red,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
