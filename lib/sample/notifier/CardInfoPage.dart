import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/sample/notifier/CardModel.dart';
import 'package:flutter_app_sample/sample/notifier/CardModelByNotifierProvider.dart';
import 'package:provider/provider.dart';

///
/// CardInfoPage
/// [
/// ChangeNotifier
/// ChangeNotifierProvider
/// Consumer
/// ]
///
class CardInfoPage extends AppCommonStatefulPage {
  CardModelBYNotifierProvider _cardModelBYNotifierProvider;

  callback() {
    /*
    Render
    */
    setState(stateCallback: () {});
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

  @override
  Config createConfig() {
    return Config(titleName: "组件间通信");
  }

  @override
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
            builder: (BuildContext context) => _cardModelBYNotifierProvider,
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
}
