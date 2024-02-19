class Book {
  String id;
  String title;
  String subtitle;
  List authors;
  String publishedDate;
  String thumbnail;
  String previewLink;
  //생성자
  Book({
    //'{'가 붙으면 named parameter
    //이름을 지정해 주는 파라미터
    required this.id,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publishedDate,
    required this.thumbnail,
    required this.previewLink,
  });
//Book객체의 속성을 JSON형식의 Map으로 변환
  Map toJson() {
    return {
      "id": id,
      "title": title,
      "subtitle": subtitle,
      "authors": authors,
      "publishedDate": publishedDate,
      "thumbnail": thumbnail,
      "previewLink": previewLink,
    };
  }

//JSON형식의 Map을 Book객체로 변환
  factory Book.fromJson(json) {
    return Book(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      authors: json['authors'],
      publishedDate: json['publishedDate'],
      thumbnail: json['thumbnail'],
      previewLink: json['previewLink'],
    );
  }
}
