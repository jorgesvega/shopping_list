import 'package:flutter/material.dart';
import 'shopping_list_item.dart';
import 'package:shopping_list/model/CartItem.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>, List<CartItem>>( // StoreConnector can take current app state (List<CartItem>) and map this with converter function to anything.
      converter: (store) => store.state,
      builder: (context,list) {
        return new ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, position) => new ShoppingListItem(list[position]));
      },
    );
  }
}