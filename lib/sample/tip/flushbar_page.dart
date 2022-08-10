import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

import '../../common/helper/tip_helper.dart';
import '../../common/helper/tip_type.dart' as tip_type;

///
/// FlushBarPage
class FlushBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlushBarState();
  }
}

///
/// _FlushBarState
class _FlushBarState extends State<FlushBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text("Tip msg"),
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            TabBar(
              indicatorWeight: 10,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.orange,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.title),
                  child: Text("online"),
                ),
                Tab(
                  icon: Icon(Icons.message),
                  child: Text("style"),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  FlushBarToolPage(),
                  FlushBarStylePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
/// FlushBarToolPage
class FlushBarToolPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlushBarToolState();
  }
}

///
/// _FlushBarToolState
class _FlushBarToolState extends State<FlushBarToolPage> {
  String? _tipTitle;
  String? _tipMessage;
  bool _tipIconPulse = true;
  bool _tipIconShow = true;
  bool _tipIndicatorShow = true;
  bool _tipShowProgress = false;
  int _tipSecondDuration = 0;
  double _tipBorderRadius = 0;
  double _tipMargin = 0;

  List<bool> _toggleSelected = [true, false, false, false];
  List<String> _toggleLabels = ["info", "warn", "error", "complete"];
  List<Color?> _tipStyleColors = [Colors.blue[100], Colors.orange[100], Colors.red[100], Colors.green[200]];
  List<Color?> _tipIndicatorColors = [Colors.blue[300], Colors.orange[300], Colors.red[300], Colors.blue[300]];
  List<Color?> _tipIconColors = [Colors.blue[500], Colors.orange[500], Colors.red[500], Colors.blue[500]];

  List<IconData> _tipIconDatas = [
    Icons.info_outline,
    Icons.error_outline,
    Icons.cancel,
    Icons.check_circle,
  ];
  Color? _tipStyleBackgroundColor = Colors.blue[100];
  Color? _tipStyleBorderColor = Colors.blue[100];
  Color? _tipIndicatorColor = Colors.blue[300];
  Color? _tipIconColor = Colors.blue[500];
  IconData _tipIconData = Icons.info_outline;

  List<bool> _tipStyleSelected = [true, false];
  List<AwesomeMessageStyle> _tipStyleValues = [AwesomeMessageStyle.GROUNDED, AwesomeMessageStyle.FLOATING];
  AwesomeMessageStyle _tipStyleValue = AwesomeMessageStyle.GROUNDED;

  Widget _getAwesomeMessage() {
    return AwesomeMessage(
      title: "${_tipTitle ?? 'title'}",
      titleText: Text(
        "${_tipTitle ?? '提示'}",
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
      message: "${_tipMessage ?? 'message'}",
      messageText: Text(
        "${_tipMessage ?? '提示'}",
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      icon: _tipIconShow
          ? Icon(
              _tipIconData,
              size: 28.0,
              color: _tipIconColor,
            )
          : null,
      duration: Duration(seconds: (_tipSecondDuration <= 0 || _tipSecondDuration >= 11) ? 1 : _tipSecondDuration),
      borderRadius: _tipBorderRadius,
      margin: EdgeInsets.all(_tipMargin),
      awesomeMessagePosition: AwesomeMessagePosition.TOP,
      shouldIconPulse: _tipIconPulse,
      showProgressIndicator: _tipShowProgress,
      awesomeMessageStyle: _tipStyleValue,
      backgroundColor: _tipStyleBackgroundColor!,
      borderColor: _tipStyleBorderColor,
      progressIndicatorBackgroundColor: _tipIndicatorColor,
      leftBarIndicatorColor: _tipIndicatorShow ? _tipIndicatorColor : null,
    );
  }

  Widget _getStatusToggle() {
    return ToggleButtons(
      textStyle: TextStyle(
        fontSize: 20,
      ),
      borderWidth: 5,
      borderColor: Colors.grey,
      selectedBorderColor: Colors.blue,
      borderRadius: BorderRadius.circular(5),
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _toggleSelected.length; i++) {
            if (i == index) {
              _tipStyleBackgroundColor = _tipStyleColors[index];
              _tipIndicatorColor = _tipIndicatorColors[index];
              _tipStyleBorderColor = _tipIndicatorColors[index];
              _tipIconColor = _tipIconColors[index];
              _tipIconData = _tipIconDatas[index];
              _toggleSelected[index] = !_toggleSelected[index];
            } else {
              _toggleSelected[i] = false;
            }
          }
        });
      },
      children: _toggleLabels.map((String label) {
        return Text("$label");
      }).toList(),
      isSelected: _toggleSelected,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "preview",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ToggleButtons(
                                isSelected: _tipStyleSelected,
                                onPressed: (int index) {
                                  for (int i = 0, size = _tipStyleSelected.length; i < size; i++) {
                                    if (i == index) {
                                      _tipStyleSelected[i] = !_tipStyleSelected[index];
                                      _tipStyleValue = _tipStyleValues[index];
                                    } else {
                                      _tipStyleSelected[i] = false;
                                    }
                                  }
                                  setState(() {});
                                },
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.info_outline),
                                      Text("GROUNDED"),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.info_outline),
                                      Text("FLOATING"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                    _getAwesomeMessage(),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Row(
                children: <Widget>[
                  Text("BorderRadius"),
                  Slider(
                    value: _tipBorderRadius,
                    onChanged: (double value) {
                      setState(() {
                        _tipBorderRadius = value.roundToDouble();
                      });
                    },
                    label: "$_tipBorderRadius",
                    min: 0,
                    max: 45,
                    divisions: 45,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Margin"),
                  Slider(
                    value: _tipMargin,
                    onChanged: (double value) {
                      setState(() {
                        _tipMargin = value.roundToDouble();
                      });
                    },
                    label: "$_tipMargin",
                    min: 0,
                    max: 45,
                    divisions: 45,
                  ),
                ],
              ),
              _getStatusToggle(),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              TextField(
                obscureText: false,
                onChanged: (title) {
                  setState(() {
                    _tipTitle = title;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'title',
                ),
              ),
              Divider(),
              TextField(
                obscureText: false,
                onChanged: (content) {
                  setState(() {
                    _tipMessage = content;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'content',
                ),
              ),
              ListTile(
                title: Text('Icon show'),
                trailing: Switch(
                  value: _tipIconShow,
                  onChanged: (bool value) {
                    setState(() {
                      _tipIconShow = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _tipIconShow = !_tipIconShow;
                  });
                },
              ),
              Divider(
                color: Colors.green,
                thickness: 1,
              ),
              ListTile(
                title: Text('Indicator show'),
                trailing: Switch(
                  value: _tipIndicatorShow,
                  onChanged: (bool value) {
                    setState(() {
                      _tipIndicatorShow = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _tipIndicatorShow = !_tipIndicatorShow;
                  });
                },
              ),
              Divider(
                color: Colors.green,
                thickness: 1,
              ),
              ListTile(
                title: Text('IconPulse'),
                trailing: Switch(
                  value: _tipIconPulse,
                  onChanged: (bool value) {
                    setState(() {
                      _tipIconPulse = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _tipIconPulse = !_tipIconPulse;
                  });
                },
              ),
              Divider(
                color: Colors.green,
                thickness: 1,
              ),
              ListTile(
                title: Text('ShowProgress'),
                trailing: Switch(
                  value: _tipShowProgress,
                  onChanged: (bool value) {
                    setState(() {
                      _tipShowProgress = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _tipShowProgress = !_tipShowProgress;
                  });
                },
              ),
              Divider(
                color: Colors.green,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Widget awesomeMessageWidget = _getAwesomeMessage();
          if (awesomeMessageWidget is AwesomeMessage) {
            Airoute.push(
              route: AwesomeMessageRoute(theme: null, awesomeMessage: awesomeMessageWidget),
            );
          }
        },
        child: Icon(Icons.slideshow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}

///
/// FlushBarStylePage
class FlushBarStylePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlushBarStyleState();
  }
}

///
/// _FlushBarStyleState
class _FlushBarStyleState extends State<FlushBarStylePage> {
  int _selectIndex = 0;

  List<bool> _toggleSelected = [
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ToggleButtons(
          isSelected: _toggleSelected,
          onPressed: (int index) {
            setState(() {
              for (int i = 0, size = _toggleSelected.length; i < size; i++) {
                if (i == index) {
                  _toggleSelected[index] = !_toggleSelected[index];
                } else {
                  _toggleSelected[i] = false;
                }
              }
            });
          },
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.info),
                  Text("top type"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.info_outline),
                  Text("bottom type"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
          switch (index) {
            case 0:
              TipHelper.showTip(
                context: context,
                title: "Info",
                message: "message",
                tipType: tip_type.TipType.INFO,
              );
              break;
            case 1:
              TipHelper.showTip(
                context: context,
                title: "Warn",
                message: "message",
                tipType: tip_type.TipType.WARN,
              );
              break;
            case 2:
              TipHelper.showTip(
                context: context,
                title: "Error",
                message: "message",
                tipType: tip_type.TipType.ERROR,
              );
              break;
            case 3:
              TipHelper.showTip(
                context: context,
                title: "Done",
                message: "message",
                tipType: tip_type.TipType.COMPLETE,
              );
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: "Info",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outline),
            label: "Warn",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel),
            label: "Error",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: "Done",
          ),
        ],
      ),
    );
  }
}
