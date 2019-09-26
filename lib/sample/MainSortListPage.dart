import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'CollapsingToolbarPage.dart';

class MainSortListPage extends AppCommonStatefulPage {
  String titleName = "主页";

  List<String> _bottomSheetTitles = [
    "列表项",
    "列表项",
    "列表项",
    "列表项",
    "列表项",
    "列表项",
    "列表项",
    "列表项",
    "列表项",
  ];
  var _showModalBottomSheet;

  @override
  Config createConfig() {
    return Config(
      titleName: titleName,
      showBackArrow: true,
      customBuildWidget: true,
    );
  }

  @override
  Widget createWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text("演示主页"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Image.network(
                "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low,
              ),
              Column(
                children: _bottomSheetTitles.map((String content) {
                  return Card(
                    color: Colors.blue,
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    child: ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.all(10),
                      leading: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "$content",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      trailing: Image.network(
                        "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              pushNamed(
                routeName: "ViewPagerFragmentPage",
                enterParameter:
                    EnterParameter(previousPageContext: getContext()),
              );
            },
            child: Text("Toolbar+ViewPager+Fragment"),
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              pushNamed(
                routeName: "CollapsingToolbarPage",
                enterParameter:
                    EnterParameter(previousPageContext: getContext()),
              );
            },
            child: Text("Collapsing+Toolbar+Fragment"),
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              pushNamed(
                routeName: "MainAnimSortPage",
                enterParameter:
                    EnterParameter(previousPageContext: getContext()),
              );
            },
            child: Text("Animation"),
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              showModalBottomSheet(
                context: getContext(),
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 50,
                        child: Row(children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {},
                                child: Align(
                                  child: Icon(Icons.close),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Align(
                                child: Text(
                                  "选择",
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Align(
                              child: Text(
                                "确定",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Column(
                        children: _bottomSheetTitles.map((String content) {
                          return Card(
                            color: Colors.blue,
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: ListTile(
                              onTap: () {},
                              contentPadding: EdgeInsets.all(10),
                              leading: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "$content",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              trailing: Image.network(
                                "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ]),
                  );
                },
              );
            },
            child: Text("Bottom Sheet"),
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              pushNamed(
                routeName: "CardMainPage",
                enterParameter:
                    EnterParameter(previousPageContext: getContext()),
              );
            },
            child: Text("组件间通信"),
          ),
        ],
      ),
    );
  }
}
