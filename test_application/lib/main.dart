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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.blue,
                width: 100,
                height: 100,
                child: Text('1'),
              ),
              Container(
                color: Colors.orange,
                width: 100,
                height: 100,
                child: Text('1'),
              ),
              Container(
                color: Colors.pink,
                width: 100,
                height: 100,
                child: Text('1'),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 300,
            child: Text('mango'),
            color: Colors.yellowAccent,
          ),
        ],
      ),
    );
  }
}
