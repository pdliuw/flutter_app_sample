import 'package:air_design/air_design.dart';
import 'package:flutter/material.dart';

///
/// StreamBuilderAsyncRequestPage
class StreamBuilderAsyncRequestPage extends StatefulWidget {
  const StreamBuilderAsyncRequestPage({Key? key}) : super(key: key);

  @override
  _StreamBuilderAsyncRequestPageState createState() => _StreamBuilderAsyncRequestPageState();
}

class _StreamBuilderAsyncRequestPageState extends State<StreamBuilderAsyncRequestPage> {
  final Stream<String> _bids = (_getNetworkData)();

  @override
  void initState() {
    super.initState();
  }

  static Stream<String> _getNetworkData() async* {
    yield "努力加载中...";
    await Future<dynamic>.delayed(const Duration(seconds: 10));
    yield "已获取数据，解析中...";
    await Future<dynamic>.delayed(const Duration(seconds: 10));
    yield "{'name': 'James', 'nickName': 'Apple'}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("使用StreamBuilder异步操作"),
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
                    child: Text("使用StreamBuilder模拟异步交互"),
                  ),
                  Spacer(),
                  StreamBuilder(
                      stream: _bids,
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
