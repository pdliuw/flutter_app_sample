import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

///
/// DragListPage
class DragListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DragListState();
  }
}

///
/// _DragListState
class _DragListState extends State<DragListPage> {
  List _tabElements = [
    {
      "name": "列表拖拽",
      "icon": Icon(Icons.list),
    },
    {
      "name": "侧滑删除",
      "icon": Icon(Icons.list),
    },
    {
      "name": "列表侧滑",
      "icon": Icon(Icons.list),
    },
    {
      "name": "表格拖拽",
      "icon": Icon(Icons.grid_on),
    },
  ];

  Widget createWidget() {
    return DefaultTabController(
      length: _tabElements.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('拖拽'),
          bottom: TabBar(
            isScrollable: true,
            tabs: _tabElements.map((tab) {
              return Tab(
                child: Text("${tab['name']}"),
                icon: tab['icon'],
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            ListViewDragWidget(),
            ListViewDismissibleWidget(),
            ListViewSlideWidget(),
            GridViewDragWidget(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return createWidget();
  }
}

class Person {
  late String _name;
  late int _age;

  Person({required String name, required int age}) {
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

///
/// ListViewDragWidget
class ListViewDragWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewDragState();
  }
}

///
/// _ListViewDragState
class _ListViewDragState extends State<ListViewDragWidget> {
  List<Person> _personNames = [
    Person(name: "Air", age: 20),
    Person(name: "James", age: 28),
    Person(name: "Lucy", age: 35),
    Person(name: "Tom", age: 14),
    Person(name: "Jack", age: 16),
    Person(name: "Jac", age: 28),
    Person(name: "Alice", age: 28),
  ];

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final oddItemColor = colorScheme.primary.withOpacity(1.0);
    final evenItemColor = colorScheme.primary.withOpacity(0.1);

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {},
        buildDefaultDragHandles: true,
        dragStartBehavior: DragStartBehavior.down,
        scrollDirection: Axis.vertical,
        children: [
          for (int index = 0; index < _personNames.length; index++)
            Card(
              color: index.isOdd ? oddItemColor : evenItemColor,
              key: Key("${_personNames[index].name}"),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: CircleAvatar(
                  child: Text("${_personNames[index].name.substring(0, 1)}"),
                ),
                title: Text(
                  "${_personNames[index].name}",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "${_personNames[index].age}岁",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

///
/// ListViewDismissibleWidget
class ListViewDismissibleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewDismissibleState();
  }
}

///
/// _ListViewDismissibleState
class _ListViewDismissibleState extends State<ListViewDismissibleWidget> {
  List<Person> _personNames = [
    Person(name: "Air", age: 20),
    Person(name: "James", age: 28),
    Person(name: "Lucy", age: 35),
    Person(name: "Tom", age: 14),
    Person(name: "Jack", age: 16),
    Person(name: "Zoom", age: 28),
    Person(name: "Jac", age: 28),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _personNames.length,
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        Person person = _personNames[index];
        return Dismissible(
          key: Key("dismissibleKey"),
          background: Container(
            child: Text("侧滑删除"),
          ),
          secondaryBackground: Container(
            child: Text("侧滑删除"),
          ),
          direction: DismissDirection.horizontal,
          child: Card(
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
              trailing: Text("侧滑移除"),
            ),
          ),
        );
      },
    );
  }
}

///
/// GridViewDragPage
class GridViewDragWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridViewDragState();
  }
}

class _GridViewDragState extends State<GridViewDragWidget> {
  List<Person> _personNames = [
    Person(name: "Air", age: 20),
    Person(name: "James", age: 28),
    Person(name: "Lucy", age: 35),
    Person(name: "Tom", age: 14),
    Person(name: "Jack", age: 16),
    Person(name: "Zoom", age: 28),
    Person(name: "Jac", age: 28),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _personNames.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return LongPressDraggable<Person>(
          data: _personNames[index],
          child: DragTarget(builder: (BuildContext context, List<int?> candidateData, List<dynamic> rejectedData) {
            return Card(
              margin: EdgeInsets.all(10),
              elevation: 2,
              color: Colors.blue,
              key: Key("${_personNames.elementAt(index).name}"),
              child: GridTileBar(
                leading: CircleAvatar(
                  child: Text("${_personNames.elementAt(index).name.substring(0, 1)}"),
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
                  child: Text("${_personNames.elementAt(index).name.substring(0, 1)}"),
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
    );
  }
}

///
/// ListViewSlideWidget
class ListViewSlideWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewSlideState();
  }
}

///
/// _ListViewSlideState
class _ListViewSlideState extends State<ListViewSlideWidget> {
  List<Person> _personNames = [
    Person(name: "Joe", age: 1),
    Person(name: "James", age: 2),
    Person(name: "Lucy", age: 3),
    Person(name: "Tom", age: 4),
    Person(name: "Jack", age: 5),
    Person(name: "Zoom", age: 6),
    Person(name: "Joe", age: 7),
    Person(name: "Air", age: 8),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _personNames.length,
        itemBuilder: (context, index) {
          Person person = _personNames[index];
          return Slidable(
            // startActionPane: SlidableDrawerActionPane(),
            // endActionPane: ActionPan,
            // actionExtentRatio: 0.25,
            child: Card(
              color: Theme.of(context).primaryColor,
              child: Container(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    child: Text('${person.name.substring(0, 1)}'),
                  ),
                  title: Text(
                    '${person.name}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    '${person.age}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // actions: <Widget>[
            //   IconSlideAction(
            //     caption: 'Archive',
            //     color: Colors.blue,
            //     icon: Icons.archive,
            //     onTap: () => TipHelper.showTip(
            //         context: context, title: "Archive", message: "Archive"),
            //   ),
            //   IconSlideAction(
            //     caption: 'Share',
            //     color: Colors.indigo,
            //     icon: Icons.share,
            //     onTap: () => TipHelper.showTip(
            //         context: context, title: "Share", message: "Share"),
            //   ),
            // ],
            // secondaryActions: <Widget>[
            //   IconSlideAction(
            //     caption: 'More',
            //     color: Colors.black45,
            //     icon: Icons.more_horiz,
            //     onTap: () => TipHelper.showTip(
            //         context: context, title: "More", message: "More"),
            //   ),
            //   IconSlideAction(
            //     caption: 'Delete',
            //     color: Colors.red,
            //     icon: Icons.delete,
            //     onTap: () {
            //       showCupertinoDialog(
            //           context: context,
            //           builder: (context) {
            //             return CupertinoAlertDialog(
            //               title: Text("删除"),
            //               content: Text("删除后不可恢复！立即删除"),
            //               actions: <Widget>[
            //                 CupertinoDialogAction(
            //                   child: Text("取消"),
            //                   onPressed: () {
            //                     Airoute.pop();
            //                   },
            //                   isDefaultAction: true,
            //                 ),
            //                 CupertinoDialogAction(
            //                   child: Text("确定"),
            //                   onPressed: () {
            //                     setState(() {
            //                       _personNames.removeAt(index);
            //                     });
            //                     Airoute.pop();
            //                   },
            //                   isDefaultAction: false,
            //                 ),
            //               ],
            //             );
            //           });
            //     },
            //   ),
            // ],
          );
        });
  }
}
