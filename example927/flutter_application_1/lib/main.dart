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
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.red,
        ),
        //해당 flexible과 expanded는 서로 같아 보이지만,
        //flexible은 row, column일때 자식의 영역에 따라 달라질 수 있음
        //width, height을 줬을때 차이를 확인할수있음
        Flexible(
          child: Container(
            color: Colors.blue,
            height: 100,
          ),
        ),
        //expanded는 높낮이에 상관없이 나머지 영역을 차지한다.
        //expanded는 높낮이가 기본적으로 정해져있지 않다.
        //그래서 SingleChildScrollView 안에서의 사용은 flutter가 읽을 수 없게 된다.
        //상위 오류의 해결법은 expanded 대신 flexible을 사용하는것
        Expanded(
          child: Container(
            color: Colors.yellow,
            height: 100,
          ),
        ),
        // Flexible(
        //   flex: 1,
        //   child: Container(
        //     color: Colors.red,
        //   ),
        // ),
        // Flexible(
        //   flex: 2,
        //   child: Container(
        //     color: Colors.blue,
        //   ),
        // )
      ],
    );
  }
}
