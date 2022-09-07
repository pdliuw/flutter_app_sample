import 'package:flutter/material.dart';
import 'package:flutter_app_sample/sample/collapsing_toolbar_page.dart';

///
/// HeroAnimPage
/// 过渡动画
///
class HeroAnimPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HeroAnimState();
  }
}

///
/// _HeroAnimState
class _HeroAnimState extends State<HeroAnimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero animation"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            /*
            为Hero动画加"透明动画的页面切换"
            */
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: CollapsingToolbarPage(),
              );
            }));
          },
          child: Card(
            color: Colors.blue,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: "hero_image",
                  child: Image.asset(
                    "assets/pexels-photo-396547.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Hero(
                  tag: "hero_text",
                  child: Text(
                    "点击我,查看Hero效果",
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
