import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

///
/// CurvedNavigationBarPage
class CurvedNavigationBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CurvedNavigationBarState();
  }
}

///
/// _CurvedNavigationBarState
class _CurvedNavigationBarState extends State<CurvedNavigationBarPage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom"),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 59.0,
        items: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              bottom: 0,
            ),
            child: Column(
              children: <Widget>[
                Icon(Icons.add, size: 20),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              bottom: 0,
            ),
            child: Column(
              children: <Widget>[
                Icon(Icons.list, size: 20),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              bottom: 0,
            ),
            child: Column(
              children: <Widget>[
                Icon(Icons.compare_arrows, size: 20),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              bottom: 0,
            ),
            child: Column(
              children: <Widget>[
                Icon(Icons.call_split, size: 20),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              bottom: 0,
            ),
            child: Column(
              children: <Widget>[
                Icon(Icons.perm_identity, size: 20),
              ],
            ),
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_page.toString(), textScaleFactor: 10.0),
              RaisedButton(
                child: Text('Go To Page of index 1'),
                onPressed: () {
                  final CurvedNavigationBarState navBarState = _bottomNavigationKey.currentState as CurvedNavigationBarState;
                  navBarState.setPage(1);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
