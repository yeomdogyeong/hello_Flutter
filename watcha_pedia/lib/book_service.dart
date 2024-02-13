import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'book.dart';

class BookService extends ChangeNotifier {
  List<Book> bookList = []; // 책 목록

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
  }
}
