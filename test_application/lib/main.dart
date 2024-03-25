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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
        ],
      ),
    );
  }
}
