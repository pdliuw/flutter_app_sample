import 'package:flutter/material.dart' hide MenuItem;
// import 'package:popup_menu/popup_menu.dart';

///
/// MainPopupPage
class MainPopupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPopupState();
  }
}

///
/// _MainPopupState
class _MainPopupState extends State<MainPopupPage> {
  GlobalKey btnKey = GlobalKey();
  GlobalKey btnKey2 = GlobalKey();
  GlobalKey btnKey3 = GlobalKey();

  GlobalKey btnKey1Right = GlobalKey();
  GlobalKey btnKey2Right = GlobalKey();
  GlobalKey btnKey3Right = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   PopupMenu.context = context;
  //
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Popup"),
  //     ),
  //     body: Row(
  //       children: <Widget>[
  //         Spacer(),
  //         Column(children: <Widget>[
  //           Spacer(),
  //           RaisedButton.icon(
  //             key: btnKey,
  //             onPressed: () {
  //               _createMenu(btnKey);
  //             },
  //             icon: Icon(Icons.folder_open),
  //             label: Text("left top"),
  //           ),
  //           Spacer(),
  //           Spacer(),
  //           RaisedButton.icon(
  //             key: btnKey2,
  //             onPressed: () {
  //               _createMenu(btnKey2);
  //             },
  //             icon: Icon(Icons.folder_open),
  //             label: Text("left center"),
  //           ),
  //           Spacer(),
  //           Spacer(),
  //           RaisedButton.icon(
  //             key: btnKey3,
  //             onPressed: () {
  //               _createMenu(btnKey3);
  //             },
  //             icon: Icon(Icons.folder_open),
  //             label: Text("left bottom"),
  //           ),
  //           Spacer(),
  //         ]),
  //         Spacer(),
  //         Spacer(),
  //         Column(children: <Widget>[
  //           Spacer(),
  //           RaisedButton.icon(
  //             key: btnKey1Right,
  //             onPressed: () {
  //               _createMenu(btnKey1Right);
  //             },
  //             icon: Icon(Icons.folder_open),
  //             label: Text("right top"),
  //           ),
  //           Spacer(),
  //           Spacer(),
  //           RaisedButton.icon(
  //             key: btnKey2Right,
  //             onPressed: () {
  //               _createMenu(btnKey2Right);
  //             },
  //             icon: Icon(Icons.folder_open),
  //             label: Text("right center"),
  //           ),
  //           Spacer(),
  //           Spacer(),
  //           RaisedButton.icon(
  //             key: btnKey3Right,
  //             onPressed: () {
  //               _createMenu(btnKey3Right);
  //             },
  //             icon: Icon(Icons.folder_open),
  //             label: Text("right bottom"),
  //           ),
  //           Spacer(),
  //         ]),
  //         Spacer(),
  //       ],
  //     ),
  //   );
  // }
  //
  // _createMenu(GlobalKey globalKey) {
  //   PopupMenu menu = PopupMenu(
  //       backgroundColor: Colors.teal,
  //       lineColor: Colors.tealAccent,
  //       maxColumn: 3,
  //       items: [
  //         MenuItem(title: 'Copy', image: Image.asset('assets/avatar.jpg')),
  //         MenuItem(
  //             title: 'Home',
  //             textStyle: TextStyle(fontSize: 10.0, color: Colors.tealAccent),
  //             image: Icon(
  //               Icons.home,
  //               color: Colors.white,
  //             )),
  //         MenuItem(
  //             title: 'Mail',
  //             image: Icon(
  //               Icons.mail,
  //               color: Colors.white,
  //             )),
  //         MenuItem(
  //             title: 'Power',
  //             image: Icon(
  //               Icons.power,
  //               color: Colors.white,
  //             )),
  //         MenuItem(
  //             title: 'Setting',
  //             image: Icon(
  //               Icons.settings,
  //               color: Colors.white,
  //             )),
  //         MenuItem(
  //             title: 'PopupMenu',
  //             image: Icon(
  //               Icons.menu,
  //               color: Colors.white,
  //             ))
  //       ],
  //       onClickMenu: onClickMenu,
  //       onDismiss: onDismiss);
  //   menu.show(widgetKey: globalKey);
  // }
  //
  // void onClickMenu(MenuItemProvider item) {
  //   print('Click menu -> ${item.menuTitle}');
  // }
  //
  // void onDismiss() {
  //   print('Menu is dismiss');
  // }
  //
  // void stateChanged(bool isShow) {
  //   print('menu is ${isShow ? 'showing' : 'closed'}');
  // }
}
