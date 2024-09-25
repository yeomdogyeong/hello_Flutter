import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'hello flutter',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Image.network(
                    "https://i.ibb.co/nngK6j3/startup.png",
                    width: 84,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: '이메일',
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 24),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) {
                          return Colors.blue;
                        },
                      ),
                      foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white,
                      ),
                    ),
                    onPressed: () {
                      print('로그인 버튼 클릭');
                    },
                    child: Text('로그인'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
