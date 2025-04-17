import 'package:flutter/material.dart';
import 'package:prov_shop_app/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _productList = [
    Product(name: 'Apple', price: '850', imagePath: 'assets/images/apple.png'),
    Product(
        name: 'Avocado',
        price: '350',
        imagePath: 'assets/images/avocado_real.png'),
    Product(
        name: 'Cabbage', price: '2500', imagePath: 'assets/images/cabbage.png'),
    Product(
        name: 'Carrot', price: '150', imagePath: 'assets/images/carrot.png'),
    Product(
        name: 'Eggplant',
        price: '400',
        imagePath: 'assets/images/eggplant.png'),
    Product(
        name: 'Garlic', price: '400', imagePath: 'assets/images/garlic.png'),
    Product(
        name: 'Ginger', price: '300', imagePath: 'assets/images/ginger.png'),
    Product(
        name: 'Lettuce', price: '1050', imagePath: 'assets/images/lettuce.png'),
    Product(
        name: 'Mustard', price: '50', imagePath: 'assets/images/mustard.png'),
    Product(name: 'Onion', price: '100', imagePath: 'assets/images/onion.png'),
    Product(
        name: 'Orange', price: '200', imagePath: 'assets/images/orange.png'),
    Product(
        name: 'Tomato', price: '1000', imagePath: 'assets/images/tomato.png'),
  ];

  List<Product> get productList => List.unmodifiable(_productList);

//boiler quantity
  int _quantity = 0;
//increment quantity of product
  void incrementQunatity(Product product) {
    product.quantity++;
    notifyListeners();
  }

  //decrement quantity of product
  void decrementQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
      notifyListeners();
    }
  }

  int quantity(Product product) {
    _quantity = product.quantity;
    return _quantity;
  }
}
