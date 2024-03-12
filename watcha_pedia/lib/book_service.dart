import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'book.dart';
import 'main.dart';

class BookService extends ChangeNotifier {
  ///Dart : 클래스의 인스턴스가 생성될 때 생성자는 자동으로 호출된다.
  BookService() {
    loadLikedBookList();
  }

  List<Book> bookList = []; // 책 목록
  List<Book> likedBookList = []; //좋아요한 책 목록

  //좋아요 토글함수 : 좋아요한 책 목록을 돌면서 선택한 bookid가 있을때 : 없애고
  //없을때 : 해당 id를 가진 listtile를 추가

  void toggleLikeBook({required Book book}) {
    String bookId = book.id;
    if (likedBookList.map((el) => el.id).contains(bookId)) {
      likedBookList.removeWhere((element) => element.id == bookId);
    } else {
      likedBookList.add(book);
    }
    notifyListeners();
    saveLikedBookList();
  }

  void search(String q) async {
    bookList.clear();

    if (q.isNotEmpty) {
      Response res = await Dio().get(
        "https://www.googleapis.com/books/v1/volumes?q=$q&startIndex=0&maxResults=40",
      );
      List items = res.data["items"];

      for (Map<String, dynamic> item in items) {
        Book book = Book(
          id: item['id'],
          //?? => 비어있으면 뒤의 값을 대신 넣어줌
          title: item['volumeInfo']['title'] ?? "",
          subtitle: item['volumeInfo']['subtitle'] ?? "",
          authors: item['volumeInfo']['authors'] ?? [],
          publishedDate: item['volumeInfo']['publishedDate'] ?? "",
          thumbnail: item['volumeInfo']['imageLinks']?['thumbnail'] ??
              //밑의 주소는 섬네일이 없을 경우의 이미지
              "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg",
          previewLink: item['volumeInfo']['previewLink'] ?? "",
        );
        bookList.add(book);
      }
    }
    notifyListeners();
  }

  saveLikedBookList() {
    //toList() => iterable(map매서드)를 List로 변환
    List likedBookJsonList = likedBookList.map((el) => el.toJson()).toList();
    // [{"content": "1"}, {"content": "2"}]

    //Dart객체를 Json형식의 문자열로 변환
    String jsonString = jsonEncode(likedBookJsonList);
    // '[{"content": "1"}, {"content": "2"}]'

    //SharedPreferences 인스턴스인 prefs에 문자열 값 저장 setString으로 두 개의 매개변수 받음
    prefs.setString('likedBookList', jsonString);
  }

  loadLikedBookList() {
    String? jsonString = prefs.getString('likedBookList');
    // '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null이면 로드 x

    //Json형식을 Dart객체로 변환
    List likedBookJsonList = jsonDecode(jsonString);
    // [{"content": "1"}, {"content": "2"}]

    likedBookList =
        likedBookJsonList.map((json) => Book.fromJson(json)).toList();
  }
}
