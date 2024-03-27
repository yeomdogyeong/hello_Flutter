import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeWidget(),
    ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: TestWidget(),
    ));
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextCheckBox(),
      ],
    );
  }
}

class TextCheckBox extends StatefulWidget {
  const TextCheckBox({super.key});

  @override
  State<TextCheckBox> createState() => _TextCheckBoxState();
}

class _TextCheckBoxState extends State<TextCheckBox> {
  late List<bool> check;

  @override
  void initState() {
    super.initState();
    //초깃값 설정
    check = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: check[0],
            onChanged: (value) => handleChange(0, value ?? false)),
        Checkbox(
            value: check[1],
            onChanged: (value) => handleChange(1, value ?? false)),
        Checkbox(
            value: check[2],
            onChanged: (value) => handleChange(2, value ?? false)),
      ],
    );
  }

  void handleChange(int idx, bool value) {
    //check인덱스의 불리언 값을 바꿔야함
    setState(() {
      //ui가 변경되어야할 때 감싸줌
      check[idx] = !check[idx];
    });
  }
}
