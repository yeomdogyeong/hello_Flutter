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
    return Stack(
      children: [
        Container(
          width: 400,
          height: 400,
          color: Colors.blue,
        ),
        Container(
          width: 300,
          height: 300,
          color: Colors.red,
        ),
        Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.orange,
            )),
      ],
    );
  }
}
