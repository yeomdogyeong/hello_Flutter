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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 음식 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "탑건: 매버릭",
        "imgUrl": "https://i.ibb.co/sR32PN3/topgun.jpg",
      },
      {
        "category": "마녀2",
        "imgUrl": "https://i.ibb.co/CKMrv91/The-Witch.jpg",
      },
      {
        "category": "범죄도시2",
        "imgUrl": "https://i.ibb.co/2czdVdm/The-Outlaws.jpg",
      },
      {
        "category": "헤어질 결심",
        "imgUrl": "https://i.ibb.co/gM394CV/Decision-to-Leave.jpg",
      },
      {
        "category": "브로커",
        "imgUrl": "https://i.ibb.co/MSy1XNB/broker.jpg",
      },
      {
        "category": "문폴",
        "imgUrl": "https://i.ibb.co/4JYHHtc/Moonfall.jpg",
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Movie Reviews'), actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            print('click');
          },
        ),
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: '영화 제목 입력하기',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          Divider(height: 1),
          Expanded(
              child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              String category = dataList[index]['category'];
              String imgUrl = dataList[index]['imgUrl'];
              return Card(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    imgUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  Text(category,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                      ))
                ],
              ));
            },
          ))
        ],
      ),
    );
  }
}
