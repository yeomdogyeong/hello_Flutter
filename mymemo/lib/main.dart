import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymemo/memo_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MemoService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// 홈 페이지
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //consumer 형식과 비슷한 builder로 감싸준 후
    return Consumer<MemoService>(
      builder: (context, memoService, child) {
        // memoService로 부터 memoList 가져오기
        List<Memo> memoList = memoService.memoList;

        void togglePin() {}
        return Scaffold(
          appBar: AppBar(
            title: Text("mymemo"),
          ),
          body: memoList.isEmpty
              ? Center(child: Text('메모를 작성해 주세요'))
              : ListView.builder(
                  itemCount: memoList.length,
                  itemBuilder: (context, index) {
                    Memo memo = memoList[index];
                    return ListTile(
                      leading: IconButton(
                        onPressed: () {
                          //눌렀을때 제일 상단으로 고정시키기
                          memoService.updatePinMemo(index: index);
                          print('$memo : pin 클릭 됨');
                        },
                        // icon: Icon(CupertinoIcons.pin),
                        icon: memo.isPinned
                            ? Icon(CupertinoIcons.pin_fill)
                            : Icon(CupertinoIcons.pin),
                      ),
                      title: Text(
                        memo.content,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailPage(
                              index: index,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              // + 버튼 클릭시 메모 생성 및 수정 페이지로 이동

              memoService.createMemo(content: '');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(
                    index: memoService.memoList.length - 1,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// 메모 생성 및 수정 페이지
class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.index});

  final int index;

  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //context.read<클래스명>을 이용하면 위젯 트리 상단에 있는 provider로 등록한 클래스에 접근가능
    //context.read<클래스명>은 주로 변수, 함수만 이용할 때
    //consumer는 변화에 따라 새로운 화면을 그려줄 필요가 있을때
    MemoService memoService = context.read<MemoService>();
    Memo memo = memoService.memoList[index];

    contentController.text = memo.content;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // 삭제 버튼 클릭시
              // 해당 memoList의 해당 인덱스를 가져와서 삭제
              showDeleteDialog(context, memoService);
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: contentController,
          decoration: InputDecoration(
            hintText: "메모를 입력하세요",
            border: InputBorder.none,
          ),
          autofocus: true,
          maxLines: null,
          expands: true,
          keyboardType: TextInputType.multiline,
          onChanged: (value) {
            // 텍스트필드 안의 값이 변할 때
            // memoList[index] = value;
            memoService.updateMemo(index: index, content: value);
          },
        ),
      ),
    );
  }

  void showDeleteDialog(BuildContext context, MemoService memoService) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("are you really going to delete?"),
          //actions: dialog 밑에 있는 버튼들
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('cancel')),
            TextButton(
                onPressed: () {
                  memoService.deleteMemo(index: index);
                  // memoList.removeAt(index);
                  //팝업 닫기
                  Navigator.pop(context);
                  //homepage로 돌아가기
                  Navigator.pop(context);
                },
                child: Text(
                  'accept',
                  style: TextStyle(color: Colors.pink),
                )),
          ],
        );
      },
    );
  }
}
