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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
        ],
      ),
    );
  }
}
