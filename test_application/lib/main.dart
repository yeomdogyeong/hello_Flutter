import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('im abbbar'),
        ),
        body: customContainer(),
      ),
    ),
  );
}

class customContainer extends StatelessWidget {
  const customContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            color: Colors.green,
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
