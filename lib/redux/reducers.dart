import 'package:shopping_list/model/CartItem.dart';
import 'package:shopping_list/redux/actions.dart';

List<CartItem> cartItemReducer(List<CartItem> items, dynamic action) {
  if (action is AddItemAction) {
    return addItem(items, action);
  }
  else if (action is ToggleItemStateAction) {
    return toggleItemState(items, action);
  }
  return items;
}

List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
  return new List.from(items)..add(action.item); // Two dots: Cascade notation. This allow us to make some operations on this object (add items to the list), and return it.
}

List<CartItem> toggleItemState(List<CartItem> items, ToggleItemStateAction action) {
  List<CartItem> itemsNew = items.map((item) => item.name == action.item.name ? action.item : item).toList();
  return itemsNew;
}

/*
Instructor says:
Both methods addItem() and toggleItemState() return new lists — that’s our new application state. 
As you can see, you shouldn’t modify current list. Instead of it, we create new lists every time.
*/