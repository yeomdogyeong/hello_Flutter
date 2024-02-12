import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed.dart';

class CatData {
  final String imageUrl;
  final String title;

  CatData({
    required this.imageUrl,
    required this.title,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CatData> catDataList = [
      CatData(imageUrl: "https://ifh.cc/g/w913Hf.jpg", title: "샌드위치 팝니다"),
      CatData(
          imageUrl: "https://ifh.cc/g/jrZ3oq.jpg",
          title: "대신 사진 찍어드려요! 가격은 문의해주세요"),
      CatData(imageUrl: "https://ifh.cc/g/6jZcK5.jpg", title: "스노우볼 팝니다"),
      CatData(
          imageUrl: "https://ifh.cc/g/tGQ4BT.jpg", title: "밝고 예쁜 수채화 그림 팝니다~"),
      CatData(
          imageUrl: "https://ifh.cc/g/7Ysffq.jpg", title: "주말 동호회에서 노래 불러드립니다"),
      CatData(imageUrl: "https://ifh.cc/g/vTAmsZ.jpg", title: "다람쥐케이크 팝니다"),
      CatData(imageUrl: "https://ifh.cc/g/h1lknT.jpg", title: "예쁜 겨울액자 팔아요"),
      CatData(imageUrl: "https://ifh.cc/g/pCb3tQ.jpg", title: "그림 대신 그려드립니다."),
      CatData(imageUrl: "https://ifh.cc/g/TRMMPH.jpg", title: "3d 피규어 팔아요"),
      CatData(imageUrl: "https://ifh.cc/g/G0loNQ.jpg", title: "불곰 구경시켜드립니다."),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //얼마나 떠있는지를 지정
        elevation: 0.5,

        leading: Row(
          children: [
            //왼쪽 여백 지정
            SizedBox(width: 16),
            Text(
              '방화동',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
            ),
          ],
        ),
        //leading의 width지정
        leadingWidth: 100,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_rounded, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.bell, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
          itemCount: catDataList.length,
          itemBuilder: (context, index) {
            final catData = catDataList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Feed(
                catData: catData,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 240, 133, 76),
        elevation: 1,
        shape: CircleBorder(),
        splashColor: Colors.orange,
        child: Icon(
          Icons.add_rounded,
          size: 36,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '홈',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_outlined),
            label: '동네생활',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good_outlined),
            label: '내 근처',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: '나의 당근',
          ),
        ],
        currentIndex: 0,
      ),
    );
  }
}
