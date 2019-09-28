import 'package:flutter/material.dart';

import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

class DragListPage extends AppCommonStatefulPage {
  List<Person> _personNames = [
    Person(name: "Air", age: 20),
    Person(name: "James", age: 28),
    Person(name: "Lucy", age: 35),
    Person(name: "Tom", age: 14),
    Person(name: "Jack", age: 16),
    Person(name: "Jacy", age: 28),
    Person(name: "Jacy", age: 28),
  ];

  @override
  Config createConfig() {
    return Config(titleName: "列表拖拽", customBuildWidget: true);
  }

  @override
  Widget createWidget() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('拖拽'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: "列表拖拽",
                icon: Icon(Icons.list),
              ),
              Tab(
                text: "表格拖拽",
                icon: Icon(Icons.grid_on),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ReorderableListView(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              children: _personNames.map(
                (Person person) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    elevation: 2,
                    color: Colors.blue,
                    key: Key("${person.name}"),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("${person.name.substring(0, 1)}"),
                      ),
                      title: Text(
                        "${person.name}",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "${person.age}岁",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Text("长按列表拖拽"),
                    ),
                  );
                },
              ).toList(),
              onReorder: (int oldIndex, int newIndex) {},
            ),
            GridView.builder(
              itemCount: _personNames.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return LongPressDraggable<Person>(
                  data: _personNames[index],
                  child: DragTarget(builder: (BuildContext context,
                      List<int> candidateData, List<dynamic> rejectedData) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 2,
                      color: Colors.blue,
                      key: Key("${_personNames.elementAt(index).name}"),
                      child: GridTileBar(
                        leading: CircleAvatar(
                          child: Text(
                              "${_personNames.elementAt(index).name.substring(0, 1)}"),
                        ),
                        title: Text(
                          "${_personNames.elementAt(index).name}",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "${_personNames.elementAt(index).age}岁",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }),
                  feedback: Container(
                    height: 200,
                    width: 200,
                    alignment: Alignment.center,
                    child: Card(
                      color: Colors.blue,
                      semanticContainer: false,
                      margin: EdgeInsets.all(10),
                      elevation: 2,
                      key: Key("${_personNames.elementAt(index).name}"),
                      child: GridTileBar(
                        leading: CircleAvatar(
                          child: Text(
                              "${_personNames.elementAt(index).name.substring(0, 1)}"),
                        ),
                        title: Text(
                          "${_personNames.elementAt(index).name}",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "${_personNames.elementAt(index).age}岁",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Person {
  String _name;
  int _age;

  Person({@required String name, @required int age}) {
    this._name = name;
    this._age = age;
  }

  String get name => _name;
  int get age => _age;
  set name(String name) {
    this._name = name;
  }

  set age(int age) {
    this._age = age;
  }
}
