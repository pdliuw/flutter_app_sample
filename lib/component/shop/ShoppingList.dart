import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/component/shop/Product.dart';
import 'package:flutter_app_sample/component/shop/ShoppingListItem.dart';

///商品列表
class ShoppingList extends AppCommonStatefulPage {
  Set<Product> _shoppingCart = Set<Product>();

  final List<Product> products;

  ShoppingList({Key key, this.products, EnterParameter enterParameter})
      : super(key: key, enterParameter: enterParameter);

  @override
  Config createConfig() {
    return Config(
      titleName: "商品列表",
      showAppBar: true,
      showBackArrow: true,
    );
  }

  @override
  Widget createWidget() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        return ShoppingListItem(
          product: products[position],
          inCart: true,
          onCartChanged: _handleCartChanged,
        );
      },
      padding: EdgeInsets.all(5.0),
      itemCount: products.length,
    );
  }

  void _handleCartChanged(Product product, bool inCart) {
    setState(stateCallback: () {
      if (!inCart)
        _shoppingCart.remove(product);
      else
        _shoppingCart.remove(product);

      print("点击了!${product} ${inCart},${products.length}");
    });
  }
}
