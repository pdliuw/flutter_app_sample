import 'package:air_design/air_design.dart';
import 'package:flutter/material.dart';

///
/// FutureBuilderAsyncRequestPage
class FutureBuilderAsyncRequestPage extends StatefulWidget {
  const FutureBuilderAsyncRequestPage({Key? key}) : super(key: key);

  @override
  _FutureBuilderAsyncRequestPageState createState() => _FutureBuilderAsyncRequestPageState();
}

class _FutureBuilderAsyncRequestPageState extends State<FutureBuilderAsyncRequestPage> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 10),
    () => 'Data Loaded',
  );

  @override
  void initState() {
    super.initState();
  }

  static Future<String> _getNetworkData() async {
    // return "努力加载中...";
    return Future<String>.delayed(
      const Duration(seconds: 10),
    ).whenComplete(() => "{'name': 'James', 'nickName': 'Apple'}");
    // yield "已获取数据，解析中...";
    // await Future<dynamic>.delayed(const Duration(seconds: 10));
    // yield "{'name': 'James', 'nickName': 'Apple'}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("使用FutureBuilder异步操作"),
      ),
      body: AppCardOutlinedStyleWidget.defaultStyle(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  FlutterLogo(),
                  AppCardOutlinedStyleWidget.defaultStyle(
                    child: Text("使用FutureBuilder模拟异步交互"),
                  ),
                  Spacer(),
                  FutureBuilder(
                      future: _calculation,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (snapshot.connectionState != ConnectionState.done) CircularProgressIndicator(),
                            Text("${snapshot.connectionState}"),
                            Text("${snapshot.data}"),
                          ],
                        );
                      }),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
