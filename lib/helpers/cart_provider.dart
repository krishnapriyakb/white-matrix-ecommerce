import 'package:flutter/material.dart';
import 'package:white_matrix_ecommerce/helpers/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  int get itemCount => _items.length;

  void addItem(Product product) {
    if (_items.containsKey(product.name)) {
      _items.update(
        product.name,
        (existingItem) => CartItem(
          product: existingItem.product,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.name,
        () => CartItem(product: product),
      );
    }
    notifyListeners();
  }

  void removeSingleItem(String productName) {
    if (!_items.containsKey(productName)) return;

    if (_items[productName]!.quantity > 1) {
      _items.update(
        productName,
        (existingItem) => CartItem(
          product: existingItem.product,
          quantity: existingItem.quantity - 1,
        ),
      );
    } else {
      _items.remove(productName);
    }
    notifyListeners();
  }

  void removeItem(String productName) {
    _items.remove(productName);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
