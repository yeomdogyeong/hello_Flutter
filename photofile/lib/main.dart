import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hi',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: TabBar(tabs: [FirstTab()]),
      ),
    );
  }
}

class FirstTab extends StatelessWidget {
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    const photos = [
      {
        'imageUrl': 'https://ifh.cc/g/w913Hf.jpg',
        'title': '소풍 왔어요',
        'writer': '어덜트 푸들',
      },
      {
        'imageUrl': 'https://ifh.cc/g/w913Hf.jpg',
        'title': '소풍 왔어요',
        'writer': '어덜트 푸들',
      },
      {
        'imageUrl': 'https://ifh.cc/g/w913Hf.jpg',
        'title': '소풍 왔어요',
        'writer': '어덜트 푸들',
      },
      {
        'imageUrl': 'https://ifh.cc/g/w913Hf.jpg',
        'title': '소풍 왔어요',
        'writer': '어덜트 푸들',
      },
      {
        'imageUrl': 'https://ifh.cc/g/w913Hf.jpg',
        'title': '소풍 왔어요',
        'writer': '어덜트 푸들',
      },
      {
        'imageUrl': 'https://ifh.cc/g/w913Hf.jpg',
        'title': '소풍 왔어요',
        'writer': '어덜트 푸들',
      },
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Icon(Icons.settings),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '사진 게시판',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(Icons.error_outline),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '주의사항',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '내 정보',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(Icons.folder_open),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '파일',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 16),
            Text(
              '최근 사진들',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 5,
                ),
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  var photo = photos[index];
                  String imageUrl = photo['imageUrl']!;
                  String title = photo['title']!;
                  String writer = photo['writer']!;

                  return Container(
                    margin: EdgeInsets.only(
                      left: 4,
                      right: 4,
                      top: 4,
                      bottom: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            //현재 화면의 넓이를 가져옴
                            height: MediaQuery.of(context).size.width *
                                //화면 넓이 절반 사용
                                0.5 *
                                //이미지의 가로 세로 비율 : 5:3
                                5 /
                                3 *
                                //최종 이미지 높이
                                0.55,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  writer,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Spacer(),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
