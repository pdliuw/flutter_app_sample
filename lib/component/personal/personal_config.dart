import 'package:flutter/material.dart';

///
/// PersonalConfig
class PersonalConfig {
  PersonalConfig._();

  ///
  /// label config
  static List<dynamic> personalLabelConfig = [
    {
      "avatar": <String, dynamic>{
        "widget": ClipOval(
          child: Image.asset("assets/avatar.jpg"),
        ),
        "assetPath": "assets/avatar.jpg",
      },
      "label": <String, dynamic>{
        "widget": Text("Air"),
        "labelName": "Air",
        "": "",
      },
    },
    {
      "avatar": <String, dynamic>{
        "widget": ClipOval(
          child: Image.asset("assets/avatar.jpg"),
        ),
        "assetPath": "assets/avatar.jpg",
      },
      "label": <String, dynamic>{
        "widget": Text("男"),
        "labelName": "男",
        "": "",
      },
    },
    {
      "avatar": <String, dynamic>{
        "widget": Icon(
          Icons.date_range,
          color: Colors.green[300],
        ),
        "assetPath": "assets/avatar.jpg",
      },
      "label": <String, dynamic>{
        "widget": Text("${DateTime.now().year}"),
        "labelName": "${DateTime.now().year}",
        "": "",
      },
    },
    {
      "avatar": <String, dynamic>{
        "widget": Icon(
          Icons.face,
          color: Colors.blue[300],
        ),
        "assetPath": "assets/avatar.jpg",
      },
      "label": <String, dynamic>{
        "widget": Container(
          width: 25,
          height: 25,
          child: ClipOval(
            child: Image.asset("assets/avatar.jpg"),
          ),
        ),
        "labelName": "2020",
        "": "",
      },
    },
    {
      "avatar": <String, dynamic>{
        "widget": ClipOval(
          child: Image.asset("assets/avatar.jpg"),
        ),
        "assetPath": "assets/avatar.jpg",
      },
      "label": <String, dynamic>{
        "widget": Text("+1"),
        "labelName": "",
        "": "",
      },
    },
    {
      "avatar": <String, dynamic>{
        "widget": ClipOval(
          child: Image.asset("assets/avatar.jpg"),
        ),
        "assetPath": "assets/avatar.jpg",
      },
      "label": <String, dynamic>{
        "widget": Text("+2"),
        "labelName": "",
        "": "",
      },
    },
    {
      "avatar": <String, dynamic>{
        "widget": ClipOval(
          child: Image.asset("assets/avatar.jpg"),
        ),
        "assetPath": "assets/avatar.jpg",
      },
      "label": <String, dynamic>{
        "widget": Text("+3"),
        "labelName": "",
        "": "",
      },
    },
  ];

  ///
  /// tool config
  static List<dynamic> personalToolConfig = [
    {
      "routeName": "/SelectColorFilterPage",
      "avatar": <String, dynamic>{
        "widget": Icon(Icons.color_lens),
      },
      "title": "滤镜",
      "subtitle": "去选择滤镜",
    },
    {
      "routeName": "/NetworkCheckPage",
      "avatar": <String, dynamic>{
        "widget": Icon(Icons.network_check_rounded),
      },
      "title": "网络",
      "subtitle": "去检查网络",
    },
    {
      "routeName": "/VideoPlayerPage",
      "avatar": <String, dynamic>{
        "widget": Icon(Icons.video_call_rounded),
      },
      "title": "视频",
      "subtitle": "去播放视频",
    },
  ];

  ///
  /// user info config
  static List<dynamic> personalUserInfoConfig = [
    {
      "routeName": "/SelectColorFilterPage",
      "avatar": <String, dynamic>{
        "widget": Icon(Icons.color_lens),
      },
      "title": "滤镜",
      "subtitle": "去选择滤镜",
    },
  ];
}
