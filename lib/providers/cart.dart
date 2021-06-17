import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final Product product;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.product,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  int numItems = 0;

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  int get itemCountAll {
    return numItems;
  }

  double get totalAmount {
    double total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItem(Product product) {
    numItems++;
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (existingItem) {
        return CartItem(
            id: existingItem.id,
            product: product,
            title: existingItem.title,
            quantity: existingItem.quantity + 1,
            price: existingItem.price);
      });
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          product: product,
          title: product.title,
          quantity: 1,
          price: product.price,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(Product product, int quantity) {
    _items.remove(product.id);
    numItems -= quantity;
    product.removeItem(quantity);
    notifyListeners();
  }

  void clear(){
    _items = {};
    numItems = 0;
    notifyListeners();
  }
}
