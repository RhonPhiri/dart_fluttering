import 'package:flutter/material.dart';
import 'package:prov_shop_app/models/product.dart';

class CartItemList with ChangeNotifier {
  List<Product> _cartList = [];

  List<Product> get cartList => List.unmodifiable(_cartList);

  void addToCart(Product product) {
    _cartList.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartList.remove(
      product,
    );
    notifyListeners();
  }

  void clearCart() {
    _cartList.clear();
    notifyListeners();
  }

  void updateCartItem(int index, Product cartItem) {
    _cartList.removeAt(index);
    _cartList.insert(index, cartItem);
    notifyListeners();
  }

  String totalItemPrice(Product cartItem) {
    num price = 0;
    price = cartItem.quantity * int.parse(cartItem.price);
    return price.toString();
  }

  double totalAmount() {
    double amount = 0;
    for (var i = 0; i < _cartList.length; i++) {
      amount += int.parse(_cartList[i].price) * _cartList[i].quantity;
    }
    return amount;
  }
}
