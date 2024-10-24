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
          body: StackScreen()
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


//edgeInsets.all은 패딩을 모든 변에 제공한다
//constrainedbox는 자식 위젯의 크기 제약을 가한다
//unconstrainedbox는 부모 위젯에서 적용한 제약 조건을 제거하거나 완화한다

// ConstrainedBox 예시
 
// ConstrainedBox(
//   constraints: BoxConstraints(
//     minWidth: 100, // Minimum width is 100
//     minHeight: 50, // Minimum height is 50
//     maxWidth: 150, // Maximum width is 150
//     maxHeight: 100, // Maximum height is 100
//   ),
//   child: Container(
//     color: Colors.blue,
//     width: 200, // This width will be ignored because of the constraints
//     height: 200, // This height will be ignored because of the constraints
//   ),
// )

//위에서는 제약을 걸었기 때문에 150x100으로 제한

//UnconstrainedBox

// UnconstrainedBox(
//   child: Container(
//     color: Colors.green,
//     width: 300, // The child can exceed the parent's size constraints
//     height: 300,
//   ),
// )

//위는 부모의 크기 제약을 제거하여 300x300