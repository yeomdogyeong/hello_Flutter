import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeWidget(),
    ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: TestWidget(),
    ));
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TestCheckBox(),
        TestRadioButton(),
        TestSlider(),
        TestSwitch(),
        TestPopupMenu(),
      ],
    );
  }
}

class TestCheckBox extends StatefulWidget {
  const TestCheckBox({super.key});

  @override
  State<TestCheckBox> createState() => _TestCheckBoxState();
}

class _TestCheckBoxState extends State<TestCheckBox> {
  late List<bool> check;

  @override
  void initState() {
    super.initState();
    //초깃값 설정
    check = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          child: Text(
            'CheckBox Button',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
            ),
          ),
        ),
        Row(
          children: [
            Checkbox(
                value: check[0],
                onChanged: (value) => handleChange(0, value ?? false)),
            Checkbox(
                value: check[1],
                onChanged: (value) => handleChange(1, value ?? false)),
            Checkbox(
                value: check[2],
                onChanged: (value) => handleChange(2, value ?? false)),
          ],
        ),
      ],
    );
  }

  void handleChange(int idx, bool value) {
    //check인덱스의 불리언 값을 바꿔야함
    setState(() {
      //ui가 변경되어야할 때 감싸줌
      check[idx] = !check[idx];
    });
  }
}

enum TestValue {
  test1,
  test2,
  test3,
}

class TestRadioButton extends StatefulWidget {
  const TestRadioButton({super.key});

  @override
  State<TestRadioButton> createState() => _TestRadioButtonState();
}

class _TestRadioButtonState extends State<TestRadioButton> {
  TestValue? selectValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
          child: Text(
            'Radio Button',
            style: TextStyle(color: Colors.orange, fontSize: 20),
          ),
        ),
        RadioListTile<TestValue>(
          title: const Text('Test 1'),
          value: TestValue.test1,
          groupValue: selectValue,
          onChanged: (TestValue? value) {
            setState(() {
              selectValue = value;
            });
          },
        ),
        RadioListTile<TestValue>(
          title: const Text('Test 2'),
          value: TestValue.test2,
          groupValue: selectValue,
          onChanged: (TestValue? value) {
            setState(() {
              selectValue = value;
            });
          },
        ),
        RadioListTile<TestValue>(
          title: const Text('Test 3'),
          value: TestValue.test3,
          groupValue: selectValue,
          onChanged: (TestValue? value) {
            setState(() {
              selectValue = value;
            });
          },
        ),
      ],
    );
  }
}

class TestSlider extends StatefulWidget {
  const TestSlider({super.key});

  @override
  State<TestSlider> createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$value'),
        Slider(
          value: value as double,
          onChanged: (newValue) {
            setState(() => value = newValue);
          },
          min: 0,
          max: 10,
          divisions: 10,
          activeColor: Colors.pink,
        ),
      ],
    );
  }
}

class TestSwitch extends StatefulWidget {
  const TestSwitch({super.key});

  @override
  State<TestSwitch> createState() => _TestSwitchState();
}

class _TestSwitchState extends State<TestSwitch> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: value,
          onChanged: (newValue) => setState(
            () {
              value = newValue;
            },
          ),
        ),
        CupertinoSwitch(
          value: value,
          onChanged: (newValue) => setState(
            () {
              value = newValue;
            },
          ),
        )
      ],
    );
  }
}

class TestPopupMenu extends StatefulWidget {
  const TestPopupMenu({super.key});

  @override
  State<TestPopupMenu> createState() => _TestPopupMenuState();
}

class _TestPopupMenuState extends State<TestPopupMenu> {
  TestValue searchValue = TestValue.test1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(searchValue.name),
        PopupMenuButton(
            itemBuilder: (context) {
              return TestValue.values
                  .map((element) =>
                      //popmenuItem에 value를 정해줘야 onselected일때 바뀐항목이 제대로 표시됨
                      //Js의 input처럼 value를 꼭 첨부해주자!
                      PopupMenuItem(value: element, child: Text(element.name)))
                  .toList();
            },
            onSelected: (newValue) => setState(
                  () => searchValue = newValue,
                )),
      ],
    );
  }
}
