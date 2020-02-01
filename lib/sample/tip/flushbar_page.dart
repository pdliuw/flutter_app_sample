import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

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
  String _tipTitle;
  String _tipMessage;
  bool _tipIconPulse = true;
  bool _tipIconShow = true;
  bool _tipIndicatorShow = true;
  bool _tipShowProgress = false;
  int _tipSecondDuration = 0;

  List<bool> _toggleSelected = [true, false, false, false];
  List<String> _toggleLabels = ["info", "warnning", "error", "completed"];
  List<Color> _tipStyleColors = [
    Colors.blue[100],
    Colors.yellow[300],
    Colors.red[300],
    Colors.green[300]
  ];
  List<Color> _tipIndicatorColors = [
    Colors.blue[300],
    Colors.green[300],
    Colors.green[300],
    Colors.blue[300]
  ];
  Color _tipStyleColor = Colors.blue[100];
  Color _tipIndicatorColor = Colors.blue[300];

  Widget _getFlushBar() {
    return Flushbar(
      title: "${_tipTitle ?? 'title'}",
      message: "${_tipMessage ?? 'message'}",
      icon: _tipIconShow
          ? Icon(
              Icons.info_outline,
              size: 28.0,
              color: _tipIndicatorColor,
            )
          : null,
      duration: Duration(
          seconds: (_tipSecondDuration <= 0 || _tipSecondDuration >= 11)
              ? 1
              : _tipSecondDuration),
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: _tipIconPulse,
      showProgressIndicator: _tipShowProgress,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: _tipStyleColor,
      borderColor: _tipStyleColor,
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
              _tipStyleColor = _tipStyleColors[index];
              _tipIndicatorColor = _tipIndicatorColors[index];
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
      appBar: AppBar(
        title: Text("Tip msg"),
      ),
      body: Container(
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
                        child: Text(
                          "preview",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        height: 100,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                  _getFlushBar(),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Widget flushBarWidget = _getFlushBar();
          if (flushBarWidget is Flushbar) {
            flushBarWidget..show(context);
          }
        },
        child: Icon(Icons.slideshow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
