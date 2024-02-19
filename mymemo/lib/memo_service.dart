import 'dart:convert';

import 'package:flutter/material.dart';

import 'main.dart';

// Memo 데이터의 형식을 정해줍니다. 추후 isPinned, updatedAt 등의 정보도 저장할 수 있습니다.
class Memo {
  Memo({
    required this.content,
    this.isPinned = false,
  });

  String content;
  bool isPinned;
  //Memo 객체를 Map자료형으로 바꿔줌
  Map toJson() {
    return {'content': content, 'isPinned': isPinned};
  }

  //Map 자료형에서 Memo객체를 복원
  factory Memo.fromJson(json) {
    return Memo(content: json['content'], isPinned: json['isPinned'] ?? false);
  }
}

// Memo 데이터는 모두 여기서 관리
class MemoService extends ChangeNotifier {
  MemoService() {
    loadMemoList();
  }

  List<Memo> memoList = [
    Memo(content: '장보기 목록: 사과, 양파'), // 더미(dummy) 데이터
    Memo(content: '새 메모'), // 더미(dummy) 데이터
  ];

  createMemo({required String content}) {
    Memo memo = Memo(content: content);
    memoList.add(memo);
    notifyListeners();
    //메모를 삭제,변경,생성할 때마다 메모를 저장
    saveMemoList(); // Consumer<MemoService>의 builder 부분을 호출해서 화면 새로고침
  }

  updateMemo({required int index, required String content}) {
    Memo memo = memoList[index];
    memo.content = content;
    notifyListeners();
    saveMemoList();
  }

  updatePinMemo({required int index}) {
    Memo memo = memoList[index];
    memo.isPinned = !memo.isPinned;
    //memoList가 isPinned 되어있는 요소가 상위에 오도록 표시
    memoList = [
      ...memoList.where((el) => el.isPinned),
      ...memoList.where((el) => !el.isPinned)
    ];
    notifyListeners();
    saveMemoList();
  }

  deleteMemo({required int index}) {
    memoList.removeAt(index);
    notifyListeners();
    saveMemoList();
  }

//memoList를 기기에 저장하는 함수
  saveMemoList() {
    List memoJsonList = memoList.map((memo) => memo.toJson()).toList();
    // [{"content": "1"}, {"content": "2"}]

    String jsonString = jsonEncode(memoJsonList);
    // '[{"content": "1"}, {"content": "2"}]'

    prefs.setString('memoList', jsonString);
  }

//저장된 memoList를 다시 복원하는 함수
  loadMemoList() {
    String? jsonString = prefs.getString('memoList');
    // '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null 이면 로드하지 않음

    List memoJsonList = jsonDecode(jsonString);
    // [{"content": "1"}, {"content": "2"}]

    memoList = memoJsonList.map((json) => Memo.fromJson(json)).toList();
  }
}
