import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prov_shop_app/models/product.dart';
import 'package:prov_shop_app/models/product_list.dart';
import 'package:provider/provider.dart';
import '../models/cart_item_list.dart';

class HomeBottomSheet extends StatelessWidget {
  final Product product;

  const HomeBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartItemList>();
    final provProduct = context.read<ProductList>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 300,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.cover,
                  height: 170,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "K${product.price}",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            provProduct.incrementQunatity(product);
                          },
                          icon: Icon(Icons.add),
                        ),
                        Consumer<ProductList>(
                          builder: (context, value, child) =>
                              Text('${value.quantity(product)}'),
                        ),
                        IconButton(
                          onPressed: () {
                            provProduct.decrementQuantity(product);
                          },
                          icon: Icon(Icons.remove),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Theme.of(context).colorScheme.tertiary,
          onPressed: () {
            if (cart.cartList.contains(product)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Cart already contains ${product.name}',
                  ),
                ),
              );
            } else {
              context.read<CartItemList>().addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('${product.name} has been added to cart'),
                ),
              );
              Navigator.pop(context);
            }
          },
          child: Text(
            'Add to cart',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 16)
      ],
    );
  }
}
