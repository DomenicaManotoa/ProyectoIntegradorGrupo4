// cart.dart

import 'package:flutter/foundation.dart';
import 'package:lbp/model/cart_item.dart';

class Cart extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    // Verificar si el producto ya está en el carrito
    int index = _items.indexWhere((element) => element.productName == item.productName);

    if (index != -1) {
      // Si el producto ya está en el carrito, incrementar la cantidad
      _items[index].quantity++;
    } else {
      // Si no está en el carrito, agregar como nuevo elemento
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

