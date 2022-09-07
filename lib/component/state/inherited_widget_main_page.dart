import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/state/user_info.dart';
import 'package:flutter_app_sample/component/state/user_inherited_widget.dart';

///
/// InheritedWidgetMainPage
class InheritedWidgetMainPage extends StatefulWidget {
  const InheritedWidgetMainPage({Key? key}) : super(key: key);

  @override
  _InheritedWidgetMainPageState createState() =>
      _InheritedWidgetMainPageState();
}

class _InheritedWidgetMainPageState extends State<InheritedWidgetMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget Demo'),
      ),
      body: Center(
        child: UserInheritedWidget(
          userInfo: UserInfo(name: '老孟', age: 18),
          child: A(
            child: F(),
          ),
        ),
      ),
    );
  }
}

class A extends StatelessWidget {
  final Widget child;

  const A({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: child,
    );
  }
}

class F extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('name:${UserInheritedWidget.of(context).userInfo.name}');
  }
}

// class _InheritedWidgetMainPageState extends State<InheritedWidgetMainPage> {
//   int _counter = 0;
//   int _rebuildCounter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("InheritedWidget & InheritedModel"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text("rebuild counter：$_rebuildCounter"),
//           FrogColor(
//               color: Colors.green,
//               child: Builder(
//                 builder: (innerContext) {
//                   print("InheritedWidgetChild build");
//                   return Center(
//                     child: Text(
//                         "${(innerContext.getElementForInheritedWidgetOfExactType<FrogColor>().widget as FrogColor).color}"),
//                   );
//                 },
//               )),
//           ElevatedButton.icon(
//             onPressed: () {
//               //rebuild
//               setState(() {
//                 _rebuildCounter++;
//               });
//             },
//             icon: Icon(Icons.refresh),
//             label: Text("only rebuild page"),
//           ),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton.extended(
//         icon: Icon(Icons.add),
//         onPressed: () {
//           setState(() {
//             _counter++;
//             _rebuildCounter++;
//           });
//         },
//         label: Text("label"),
//       ),
//     );
//   }
// }
