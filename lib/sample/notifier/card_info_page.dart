import 'package:flutter/material.dart';
import 'package:flutter_app_sample/sample/notifier/card_model.dart';
import 'package:flutter_app_sample/sample/notifier/card_model_by_notifier_provider.dart';
import 'package:provider/provider.dart';

///
/// CardInfoPage
/// [
/// ChangeNotifier
/// ChangeNotifierProvider
/// Consumer
/// ]
///
class CardInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CardInfoState();
  }
}

///
/// _CardInfoState
class _CardInfoState extends State<CardInfoPage> {
  late CardModelBYNotifierProvider _cardModelBYNotifierProvider;

  callback() {
    /*
    Render
    */
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    CardModel.getInstance().addListener(callback);

    _cardModelBYNotifierProvider = CardModelBYNotifierProvider();
  }

  @override
  void dispose() {
    super.dispose();
    CardModel.getInstance().removeListener(callback);
  }

  Widget createWidget() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: FloatingActionButton(
              elevation: 2,
              child: Icon(Icons.add),
              tooltip: "增加年龄",
              onPressed: () {
                CardModel.getInstance().age = ++CardModel.getInstance().age;
                CardModel.getInstance().notify();
              },
            ),
            title: Text("姓名：${CardModel.getInstance().name}"),
            subtitle: Text("年龄：${CardModel.getInstance().age}"),
            trailing: Text("描述：点击➕号来增加年龄值"),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => _cardModelBYNotifierProvider,
            child: Consumer<CardModelBYNotifierProvider>(
              builder: (context, cart, child) {
                return RaisedButton(
                  onPressed: () {
                    _cardModelBYNotifierProvider.age =
                        ++_cardModelBYNotifierProvider.age;

                    _cardModelBYNotifierProvider.notify();
                  },
                  child: Text("Total price: ${cart.age}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("组件间通信"),
      ),
      body: createWidget(),
    );
  }
}
