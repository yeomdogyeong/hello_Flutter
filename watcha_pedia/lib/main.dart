import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'book.dart';
import 'book_service.dart';

//SharedPreferences 인스턴스를 나중에 초기화 할것을 선언
//late로 변수사용 : 나중에 초기화 될 것
late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences 인스턴스를 prefs에 할당
  //간단한 데이터를 로컬에 저장하는데 사용
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookService()),
      ],
      child: const MyApp(),
    ),
  );
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

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        SearchPage(),
        LikedBookPage(),
      ].elementAt(bottomNavIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            bottomNavIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: '좋아요',
          ),
        ],
        currentIndex: bottomNavIndex,
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookService>(
      builder: (context, bookService, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 80,
            title: TextField(
              onSubmitted: (value) {
                bookService.search(value);
              },
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: "작품, 감독, 배우, 컬렉션, 유저 등",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView.separated(
              itemCount: bookService.bookList.length,
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                if (bookService.bookList.isEmpty) return SizedBox();
                Book book = bookService.bookList.elementAt(index);
                return BookTile(book: book);
              },
            ),
          ),
        );
      },
    );
  }
}

class BookTile extends StatelessWidget {
  const BookTile({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    BookService bookService = context.read<BookService>();

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewPage(
              url: book.previewLink.replaceFirst("http", "https"),
            ),
          ),
        );
      },
      leading: Image.network(
        book.thumbnail,
        fit: BoxFit.fitHeight,
      ),
      title: Text(
        book.title,
        style: TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        "${book.authors.join(", ")}\n${book.publishedDate}",
        style: TextStyle(color: Colors.grey),
      ),
      trailing: IconButton(
          onPressed: () {
            //눌렀을 때 1. 별이 채워지고
            //2. BookService의 toggleLikeBook 넘겨줌
            bookService.toggleLikeBook(book: book);
          },
          //liked에 선택한 id가 있으면 ? 색 : border
          icon: bookService.likedBookList.map((el) => el.id).contains(book.id)
              ? Icon(
                  Icons.star,
                  color: Colors.amber,
                )
              : Icon(Icons.star_border)),
    );
  }
}

class LikedBookPage extends StatelessWidget {
  const LikedBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookService>(builder: (context, bookService, child) {
      return Scaffold(
        body: Center(
          child: ListView.separated(
              itemBuilder: (context, index) {
                Book book = bookService.likedBookList.elementAt(index);
                return BookTile(book: book);
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: bookService.likedBookList.length),
        ),
      );
    });
  }
}

class WebViewPage extends StatelessWidget {
  WebViewPage({super.key, required this.url});

  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(url),
      ),
      body: WebView(initialUrl: url),
    );
  }
}
