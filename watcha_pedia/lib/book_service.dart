import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'book.dart';

class BookService extends ChangeNotifier {
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
}
