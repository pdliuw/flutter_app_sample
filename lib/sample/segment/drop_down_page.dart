import 'package:flutter/material.dart';

enum Commands { heroAndScholar, hurricaneCame }

///
/// DropDownPage
class DropDownPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DropState();
  }
}

///
/// _DropState
class _DropState extends State<DropDownPage> {
  String dropdownValue = 'One';

  //实例变量（非静态变量）可以是final但不能是const
  //const不能修饰实例变量
  //final可以修饰实例变量

  //const不仅能修饰'类变量'，还可以修饰'变量值';
  //特殊：constVar 可以修改值(const [1,2,3]此时不可被修改值，也就是等同于是'数组')
  var constVar = const [1, 2, 3];

  //特殊：pra 不可以修改值
  static const pra = "";

  final String parame = "";

  List<String> _dropDownItems = [
    'One',
    'Two',
    'Free',
    'Four',
  ];

  bool _heroAndScholar = false;

  @override
  Widget build(BuildContext context) {
    //constVar.add(5);//Error -> 'Unsupported operation: Cannot add to an unmodifiable list'
    constVar = [1, 23];
    constVar.sort();

    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown"),
      ),
      body: Row(
        children: <Widget>[
          Spacer(),
          Column(
            children: <Widget>[
              Spacer(),
              DropdownButton<String>(
                isExpanded: false,
                isDense: false,
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 2,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                selectedItemBuilder: (BuildContext context) {
                  return _dropDownItems.map<Widget>((String item) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(item),
                    );
                  }).toList();
                },
                items: _dropDownItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Spacer(),
              PopupMenuButton<Commands>(
                onSelected: (Commands result) {
                  switch (result) {
                    case Commands.heroAndScholar:
                      setState(() {
                        _heroAndScholar = !_heroAndScholar;
                      });
                      break;
                    case Commands.hurricaneCame:
                      // ...handle hurricane option

                      break;
                    // ...other items handled here
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Commands>>[
                  CheckedPopupMenuItem<Commands>(
                    checked: _heroAndScholar,
                    value: Commands.heroAndScholar,
                    child: const Text('Hero and scholar'),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem<Commands>(
                    value: Commands.hurricaneCame,
                    child: ListTile(
                      leading: Icon(null),
                      title: Text('Bring hurricane'),
                    ),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {
                  print("first");
                  //future
                  getUserInfo().then((value) {
                    print(value);
                  }).catchError((e) {
                    print(e);
                  });

                  print("last");
                },
                child: Text("Click by future"),
              ),
              MaterialButton(
                onPressed: () async {
                  print("first");

                  //async await
                  try {
                    print(await getUserInfo());
                  } catch (e) {
                    print(e);
                  } finally {
                    print("finally");
                  }

                  print("last");
                },
                child: Text("Click by async"),
              ),
              Spacer(),
              Spacer(),
              Spacer(),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }

//  Future<String> getLoginUser() async {
//    return await Future<String>.delayed(
//      Duration(seconds: 5),
//      () {
//        return "";
//      },
//    );
//  }

  Future<String> getUserInfo() {
    return Future<String>.delayed(Duration(seconds: 5), () {
      return "delayed task";
    });
  }
}
