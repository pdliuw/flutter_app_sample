import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

///
/// _AiAwesomeMessageToolState
class AiAwesomeMessageToolPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AiAwesomeMessageToolState();
  }
}

///
/// _AiAwesomeMessageToolState
class _AiAwesomeMessageToolState extends State<AiAwesomeMessageToolPage> {
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
    Icons.check_circle_outline,
  ];
  Color? _tipStyleBackgroundColor = Colors.blue[100];
  Color? _tipStyleBorderColor = Colors.blue[100];
  Color? _tipIndicatorColor = Colors.blue[300];
  Color? _tipIconColor = Colors.blue[500];
  IconData _tipIconData = Icons.info_outline;

  List<bool> _tipStyleSelected = [true, false];
  List<AwesomeMessageStyle> _tipStyleValues = [AwesomeMessageStyle.GROUNDED, AwesomeMessageStyle.FLOATING];
  AwesomeMessageStyle _tipStyleValue = AwesomeMessageStyle.GROUNDED;

  TextEditingController? _editingControllerTitle;
  TextEditingController? _editingControllerContent;

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
  void initState() {
    super.initState();
    _editingControllerTitle = TextEditingController(text: "title");
    _editingControllerContent = TextEditingController(text: "content");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip msg"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              AppCardOutlinedStyleWidget.defaultStyle(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    )
                  ],
                ),
              ),
              AppCardOutlinedStyleWidget.defaultStyle(
                child: _getAwesomeMessage(),
              ),
              AppCardOutlinedStyleWidget.defaultStyle(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ],
                ),
              ),
              AppCardOutlinedStyleWidget.defaultStyle(
                child: _getStatusToggle(),
              ),
              AppCardOutlinedStyleWidget.defaultStyle(
                child: Column(
                  children: [
                    AppMiniInputWidget.defaultStyle(
                      value: _editingControllerTitle?.text,
                      textEditingController: _editingControllerTitle,
                      hintText: "title",
                      onChanged: (title) {
                        setState(() {
                          _editingControllerTitle?.text = title;
                          _tipTitle = title;
                        });
                      },
                    ),
                    Divider(),
                    AppMiniInputWidget.defaultStyle(
                      value: _editingControllerContent?.text,
                      textEditingController: _editingControllerContent,
                      hintText: "content",
                      onChanged: (content) {
                        setState(() {
                          _editingControllerContent?.text = content;
                          _tipMessage = content;
                        });
                      },
                    ),
                  ],
                ),
              ),
              AppCardOutlinedStyleWidget.defaultStyle(
                child: Column(
                  children: [
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Widget awesomeMessage = _getAwesomeMessage();
          if (awesomeMessage is AwesomeMessage) {
            Airoute.push(
              route: AwesomeMessageRoute(theme: null, awesomeMessage: awesomeMessage),
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
