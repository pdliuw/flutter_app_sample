import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:airoute/airoute.dart';

///
/// MainPickerPage
class MainPickerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPickerState();
  }
}

///
/// _MainPickerState
class _MainPickerState extends State<MainPickerPage> {
  String _date = '';
  String _dateAndTime = '';
  String _time = '';
  bool _cityLoop = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Picker"),
      ),
      body: Center(
        child: Wrap(
          spacing: 10,
          children: <Widget>[
            Column(
              children: <Widget>[
                FlatButton.icon(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    _showCupertinoDatePicker(
                        context: context,
                        changed: (DateTime time) {
                          setState(() {
                            _date = "${time.year}-${time.month}-${time.day}";
                          });
                        });
                  },
                  label: Text("date"),
                  icon: Icon(Icons.access_time),
                ),
                Text("$_date"),
              ],
            ),
            Column(
              children: <Widget>[
                FlatButton.icon(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    _showCupertinoDateAndTimePicker(
                        context: context,
                        changed: (year, month, day, hour, minute, second) {
                          setState(() {
                            _dateAndTime =
                                "${year}-${month}-${day} ${hour}:${minute}:${second}";
                          });
                        });
                  },
                  label: Text("date and time"),
                  icon: Icon(Icons.access_time),
                ),
                Text("$_dateAndTime"),
              ],
            ),
            Column(
              children: <Widget>[
                FlatButton.icon(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    _showCupertinoDateTimePicker(
                        context: context,
                        changed: (int hour, int minute, int second) {
                          setState(() {
                            _time = "$hour:$minute:$second";
                          });
                        });
                  },
                  label: Text("time"),
                  icon: Icon(Icons.access_time),
                ),
                Text("$_time"),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "循环",
                  style: Theme.of(context).textTheme.button,
                ),
                CupertinoSwitch(
                  value: _cityLoop,
                  onChanged: (bool selected) {
                    setState(() {
                      _cityLoop = selected;
                    });
                  },
                ),
                FlatButton.icon(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    _showCupertinoCity(
                      context: context,
                    );
                  },
                  label: Text("address"),
                  icon: Icon(Icons.date_range),
                ),
                Text("$_time"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showCupertinoCity({
    @required BuildContext context,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: CupertinoPicker(
                  itemExtent: 40,
                  onSelectedItemChanged: (int index) {},
                  looping: _cityLoop,
                  children: <Widget>[
                    Text("北京"),
                    Text("天津"),
                    Text("上海"),
                    Text("深圳"),
                    Text("广州"),
                    Text("香港"),
                    Text("澳门"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCupertinoDatePicker({
    @required BuildContext context,
    @required Function(DateTime dateTime) changed,
  }) {
    DateTime nowTime = DateTime.now();
    DateTime cacheDateTime = nowTime;
    final picker = CupertinoDatePicker(
      onDateTimeChanged: (DateTime dateTime) {
        print("the date is ${dateTime.toString()}");
        cacheDateTime = dateTime;
        changed(dateTime);
      },
      initialDateTime: DateTime.now(),
      use24hFormat: true,
      mode: CupertinoDatePickerMode.date,
    );

    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
//                      MaterialButton(
//                        onPressed: () {
//                          Airoute.pop();
//                        },
//                        child: Text("取消"),
//                      ),
//                      MaterialButton(
//                        onPressed: () {
//                          Airoute.pop();
//                        },
//                        child: Text(
//                          "确定",
//                          style: TextStyle(
//                            color: Theme.of(context).primaryColor,
//                          ),
//                        ),
//                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: picker,
                ),
              ],
            ),
          );
        });
  }

  void _showCupertinoDateAndTimePicker({
    @required BuildContext context,
    @required
        Function(
                int year, int month, int day, int hours, int minute, int second)
            changed,
  }) {
    DateTime nowTime = DateTime.now();
    DateTime cacheDateTime = nowTime;
    final picker = CupertinoDatePicker(
      onDateTimeChanged: (DateTime dateTime) {
        print("the date is ${dateTime.toString()}");
//        changed(date);
        cacheDateTime = dateTime;
        print("the date year is ${cacheDateTime.year}");
        print("the date month is ${cacheDateTime.month}");
        print("the date day is ${cacheDateTime.day}");
      },
      initialDateTime: DateTime.now(),
      use24hFormat: true,
      mode: CupertinoDatePickerMode.date,
    );

    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          Airoute.pop();
                        },
                        child: Text("取消"),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Airoute.pop();
                          //选择时间
                          _showCupertinoDateTimePicker(
                              context: context,
                              initialDateTime: cacheDateTime,
                              changed: (int hours, int minute, int second) {
                                changed(
                                  cacheDateTime.year,
                                  cacheDateTime.month,
                                  cacheDateTime.day,
                                  hours,
                                  minute,
                                  second,
                                );
                              });
                        },
                        child: Text(
                          "确定",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: picker,
                ),
              ],
            ),
          );
        });
  }

  void _showCupertinoDateTimePicker({
    @required BuildContext context,
    @required Function(int hours, int minute, int second) changed,
    DateTime initialDateTime,
  }) {
    DateTime showTime = initialDateTime ?? DateTime.now();
    DateTime dateAndTime = showTime;

    int cacheHours = showTime.hour;
    int cacheMinute = showTime.minute;
    int cacheSecond = showTime.second;
    final picker = CupertinoTimerPicker(
      alignment: Alignment.center,
      initialTimerDuration: Duration(
        hours: showTime.hour,
        minutes: showTime.minute,
        seconds: showTime.second,
      ),
      onTimerDurationChanged: (Duration duration) {
        print("the duration is :${duration.toString()}");
        print("the duration hours is :${duration.inHours}");
        print("the duration minute is :${duration.inMinutes}");
        print("the duration second is :${duration.inSeconds}");
        //下面(dateAndTime = DateTime()这种方式不可用：因为会有时间差，而且很严重，如果要用下面的方式，则需要处理时间差！
//        dateAndTime = DateTime(
//          showTime.year,
//          showTime.month,
//          showTime.day,
//          duration.inHours,
//          duration.inMinutes,
//          duration.inSeconds,
//        );
        cacheHours = duration.inHours;
        cacheMinute = duration.inMinutes - duration.inHours * 60;
        cacheSecond = duration.inSeconds - duration.inMinutes * 60;
      },
    );

    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          Airoute.pop();
                        },
                        child: Text("取消"),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Airoute.pop();

                          //call
                          changed(cacheHours, cacheMinute, cacheSecond);
                        },
                        child: Text(
                          "确定",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: picker,
                ),
              ],
            ),
          );
        });
  }
}
