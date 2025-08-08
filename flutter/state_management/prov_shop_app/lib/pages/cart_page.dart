import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prov_shop_app/components/cart_bottom_sheet.dart';
import 'package:prov_shop_app/models/cart_item_list.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartItemList>();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: cart.cartList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 200,
                  ),
                  Text(
                    'Your cart items will appear here',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Cart',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        tooltip: 'Clear cart',
                        onPressed: () {
                          cart.clearCart();
                        },
                        icon: Icon(
                          Icons.clear,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.cartList.length,
                      itemBuilder: (context, index) {
                        final cartItem = cart.cartList[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Slidable(
                            key: ValueKey(cartItem.name),
                            endActionPane: ActionPane(
                              motion: StretchMotion(),
                              children: [
                                SlidableAction(
                                  key: UniqueKey(),
                                  icon: Icons.edit,
                                  label: 'Edit',
                                  backgroundColor: Colors.green,
                                  onPressed: (context) {
                                    final cartItemIndex = context
                                        .read<CartItemList>()
                                        .cartList
                                        .indexOf(cartItem);
                                    showBottomSheet(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      showDragHandle: true,
                                      elevation: 10,
                                      context: context,
                                      builder: (context) {
                                        return CartBottomSheet(
                                          index: cartItemIndex,
                                          product: cartItem,
                                        );
                                      },
                                    );
                                  },
                                ),
                                SlidableAction(
                                  key: UniqueKey(),
                                  icon: Icons.delete,
                                  label: 'Remove',
                                  backgroundColor: Colors.red,
                                  onPressed: (context) {
                                    cart.removeFromCart(cartItem);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${cartItem.name} removed from cart successfully',
                                        ),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                // borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    cartItem.imagePath,
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text(
                                    cartItem.name,
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: '${cartItem.quantity}',
                                          style: textTheme.bodyMedium
                                              ?.copyWith(fontSize: 14),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '\nUnit price: K${cartItem.price}',
                                            ),
                                            TextSpan(
                                                text:
                                                    '\nTotal item price: K${cart.totalItemPrice(cartItem)}'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(24),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF6558CA),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total amount',
                              style: TextStyle(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            Text(
                              'K${cart.totalAmount()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Pay Now',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
