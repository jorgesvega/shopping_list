import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shopping_list/model/CartItem.dart';
import 'package:shopping_list/shopping_cart_app.dart';
import 'package:shopping_list/redux/reducers.dart';
// import 'package:redux_dev_tools/redux_dev_tools.dart'; // For time travel

void main() {
  final store = new Store<List<CartItem>>(
    cartItemReducer,
    initialState: new List());

  runApp(new FlutterReduxApp(store));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<List<CartItem>> store;

  FlutterReduxApp(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<List<CartItem>>(
      store: store,
      child: new ShoppingCartApp(),
    );
  }
}