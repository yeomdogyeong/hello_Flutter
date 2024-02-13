class Book {
  String id;
  String title;
  String subtitle;
  String thumbnail;
  String previewLink;
  //생성자
  Book({
    //'{'가 붙으면 named parameter
    //이름을 지정해 주는 파라미터
    required this.id,
    required this.title,
    required this.subtitle,
    required this.thumbnail,
    required this.previewLink,
  });
}
