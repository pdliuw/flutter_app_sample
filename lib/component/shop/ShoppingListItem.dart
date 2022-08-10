import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/shop/Product.dart';

///ShoppingListItem
///支持：Scroll Item remove item!
typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatefulWidget {
  ShoppingListItem({
    required Product product,
    required this.inCart,
    required this.onCartChanged,
  }) : product = product;

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  @override
  State<StatefulWidget> createState() {
    return _ShoppingListItem(
      product: product,
      inCart: inCart,
      onCartChanged: onCartChanged,
    );
  }
}

class _ShoppingListItem extends State<ShoppingListItem> {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  _ShoppingListItem({
    required Product product,
    required this.inCart,
    required this.onCartChanged,
  }) : product = product;

  @override
  Widget build(BuildContext context) {
    ///Dismissible-侧滑!
    ///Scaffold.of(context).showSnackBar(...)-SnackBar!
    return Dismissible(
        key: Key("${product.name}"),
        onDismissed: (DismissDirection direction) {
          //这个和Android的SnackBar差不多
          Scaffold.of(context).showSnackBar(SnackBar(
            content: new Text("${product.name} dismissed"),
            action: SnackBarAction(
                label: "撤销",
                onPressed: () {
                  print("触发Snackbar动作！");
                }),
          ));
        },
        child: Card(
          elevation: 2.0,
          margin: EdgeInsets.all(5.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Text("${product.name[0]}"),
            ),
            title: Text(
              "${product.nowPrice}",
              style: TextStyle(
                color: _getColor(context),
              ),
            ),
            subtitle: Text(
              "${product.originPrice}",
              style: _getTextStyle(context),
            ),
            contentPadding: EdgeInsets.all(10.0),
            selected: false,
            trailing: Text(
              "${product.name}",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: () {
              onCartChanged(product, !inCart);
            },
          ),
        ));
  }

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return TextStyle();

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
}
