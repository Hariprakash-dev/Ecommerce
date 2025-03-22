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

  double get totalproductprice {
    return cartItems.entries.fold(0, (sum, entry) {
      final product = entry.key;
      final quantity = entry.value;
      return sum + (product.rate * quantity);
    });
  }

  double get totalPrice {
    double subtotal = cartItems.entries.fold(0, (sum, entry) {
      final product = entry.key;
      final quantity = entry.value;
      return sum + (product.rate * quantity);
    });

    double deliverycharges = 35;
    double securedpackagingfee = 10;

    return subtotal + deliverycharges + securedpackagingfee;
  }

  int get cartItemCount {
    return _cartItems.length;
  }

  double get shippingdetails {
    double tax = 60;
    double shipping = 10;

    return totalproductprice + tax + shipping;
  }
}
