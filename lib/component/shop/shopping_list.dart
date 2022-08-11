import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/shop/product.dart';
import 'package:flutter_app_sample/component/shop/shopping_list_item.dart';

///商品列表
class ShoppingListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShoppingState();
  }
}

class _ShoppingState extends State<ShoppingListPage> {
  Set<Product> _shoppingCart = Set<Product>();

  final List<Product> products = [
    Product(name: "product", originPrice: "100", nowPrice: "59"),
  ];

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
    setState(() {
      if (!inCart)
        _shoppingCart.remove(product);
      else
        _shoppingCart.remove(product);

      print("点击了!${product} ${inCart},${products.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return createWidget();
  }
}
