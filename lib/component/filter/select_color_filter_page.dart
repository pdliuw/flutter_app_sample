import 'package:air_design/air_design.dart';
import 'package:flutter/material.dart';

///
/// SelectColorFilterPage
class SelectColorFilterPage extends StatefulWidget {
  @override
  _SelectColorFilterPageState createState() => _SelectColorFilterPageState();
}

class _SelectColorFilterPageState extends State<SelectColorFilterPage> {
  List<dynamic> _colorFilterList = [
    {
      "name": "无滤镜",
      "value": Colors.transparent,
      "checked": true,
    },
    {
      "name": "蓝色",
      "value": Colors.blue,
      "checked": false,
    },
    {
      "name": "红色",
      "value": Colors.red,
      "checked": false,
    },
    {
      "name": "橘色",
      "value": Colors.orange,
      "checked": false,
    },
    {
      "name": "灰色",
      "value": Colors.grey,
      "checked": false,
    },
    {
      "name": "绿色",
      "value": Colors.green,
      "checked": false,
    },
    {
      "name": "紫色",
      "value": Colors.purple,
      "checked": false,
    },
    {
      "name": "粉红色",
      "value": Colors.pink,
      "checked": false,
    },
    {
      "name": "棕色",
      "value": Colors.brown,
      "checked": false,
    },
    {
      "name": "琥珀色",
      "value": Colors.amber,
      "checked": false,
    },
    {
      "name": "青色",
      "value": Colors.cyan,
      "checked": false,
    },
    {
      "name": "靛蓝色",
      "value": Colors.indigo,
      "checked": false,
    },
    {
      "name": "酸橙色",
      "value": Colors.lime,
      "checked": false,
    },
    {
      "name": "黄色",
      "value": Colors.yellow,
      "checked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滤镜"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    _colorFilterList.where((element) => element['checked']).first['value'],
                    BlendMode.color,
                  ),
                  child: Image.asset(
                    "assets/avatar.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          AppTextHeadline6Widget.defaultStyle(data: "滤镜效果预览"),
          GridView.count(
            crossAxisCount: 5,
            shrinkWrap: true,
            children: [
              for (int i = 0; i < _colorFilterList.length; i++)
                AppCardOutlinedStyleWidget.defaultStyle(
                  onTap: () {
                    setState(() {
                      for (int loopIndex = 0; loopIndex < _colorFilterList.length; loopIndex++) {
                        if (i == loopIndex) {
                          _colorFilterList[loopIndex]['checked'] = true;
                        } else {
                          _colorFilterList[loopIndex]['checked'] = false;
                        }
                      }
                    });
                  },
                  useDefaultMargin: false,
                  useDefaultPadding: false,
                  child: Container(
                    color: _colorFilterList[i]['value'],
                    child: Center(
                      child: Wrap(
                        children: [
                          AppTextBodyText2Widget.defaultStyle(
                            data: "${_colorFilterList[i]['name']}",
                          ),
                          Checkbox(
                            value: _colorFilterList[i]['checked'],
                            onChanged: null,
                            autofocus: false,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
