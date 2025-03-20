import 'package:ecom/Models/product.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {

   final Map<Product, int> _cartItems = {}; 

  Map<Product, int> get cartItems => _cartItems;

  void addToCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1; 
    } else {
      _cartItems[product] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (_cartItems.containsKey(product)) {
      if (_cartItems[product]! > 1) {
        _cartItems[product] = _cartItems[product]! - 1; 
      } else {
        _cartItems.remove(product); 
      }
      notifyListeners();
    }
  }



 
}
