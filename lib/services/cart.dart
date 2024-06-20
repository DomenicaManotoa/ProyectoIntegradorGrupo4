// services/cart.dart

import 'package:flutter/foundation.dart';
import 'package:lbp/model/cart_item.dart';

class Cart extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    int index = _items.indexWhere((element) => element.productName == item.productName);

    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(item);
    }

    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  double getTotal() {
    double total = 0.0;
    for (var item in _items) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
