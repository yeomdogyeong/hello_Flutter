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
        body: RadioButtons(),
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
        Flexible(
          child: Container(
            color: Colors.blue,
            height: 100,
          ),
        ),
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

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150), color: Colors.red),
          ),
        ),
        Align(
          child: Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(140), color: Colors.white),
          ),
        ),
        Align(
          child: Text(
            'Hi',
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    );
  }
}

class RadioButtons extends StatefulWidget {
  const RadioButtons({super.key});

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //밑과 같이 하면 안먹음
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Count : $value',
          style: TextStyle(color: Colors.red),
        ),
        TestButton()
      ],
    );
  }
}

class TestButton extends StatelessWidget {
  const TestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      //입력을 받는 GestureDetector
      child: GestureDetector(
        onTap: () => print('some Text'),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                //테두리 두께
                border: Border.all(width: 1.0),
                //모서리의 둥글기 정도
                borderRadius: BorderRadius.circular(8.0)),
            child: Text('up counter'),
            padding: EdgeInsets.all(8),
          ),
        ),
      ),
    );
  }
}
