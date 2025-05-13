import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];



  void addItem(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}