import 'package:flutter/material.dart';

///
/// FadeInImagePage
/// （用于：加载网络图片，以及等待时的占位符）
class FadeInImagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FadeInImageState();
  }
}

///
/// _FadeInImageState
class _FadeInImageState extends State<FadeInImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FadeInImage"),
      ),
      body: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: NetworkImage(
                "http://img1.imgtn.bdimg.com/it/u=2052832277,3734439426&fm=26&gp=0.jpg"),
            image: NetworkImage(
                "http://img3.imgtn.bdimg.com/it/u=4127304152,1726929467&fm=26&gp=0.jpg"),
          ),
        ],
      ),
    );
  }
}
