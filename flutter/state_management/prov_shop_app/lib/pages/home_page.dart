import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prov_shop_app/models/app_theme.dart';
import 'package:prov_shop_app/models/cart_item_list.dart';
import 'package:prov_shop_app/models/product_list.dart';
import '../components/home_bottom_sheet.dart';
import 'cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = context.read<ProductList>().productList;
    final isBright = context.read<AppTheme>().isBright;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).colorScheme.surface,
        scrolledUnderElevation: 0,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              Icon(Icons.location_on_outlined),
              Text('Mangochi, Malawi'),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AppTheme>().changeTHeme();
            },
            icon: Icon(
              isBright ? Icons.wb_sunny : Icons.dark_mode,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text('R'),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              'Good morning, Mate',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              'Let\'s order fresh \nitems for you',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, bottom: 16),
            child: Text(
              'Available products',
              style: GoogleFonts.playfairDisplay(fontSize: 16),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                final isBright = Theme.of(context).colorScheme.brightness ==
                    Brightness.light;
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: AspectRatio(
                    aspectRatio: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-6, -6),
                            blurRadius: 5,
                            spreadRadius: 1,
                            color: isBright
                                ? Colors.white
                                : Theme.of(context).colorScheme.primary,
                          ),
                          BoxShadow(
                            offset: Offset(6, 6),
                            blurRadius: 5,
                            spreadRadius: 1,
                            color: isBright
                                ? Theme.of(context).colorScheme.primary
                                : Colors.black,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            product.imagePath,
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            product.name,
                            style: GoogleFonts.playfairDisplay(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('K${product.price}'),
                          MaterialButton(
                            color: Theme.of(context).colorScheme.primary,
                            onPressed: () {
                              showBottomSheet(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                showDragHandle: true,
                                elevation: 10,
                                // constraints:
                                //     BoxConstraints.tight(Size.fromHeight(200)),
                                context: context,
                                builder: (context) {
                                  return HomeBottomSheet(
                                    product: product,
                                  );
                                },
                              );
                            },
                            child: Text('Add'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          FloatingActionButton(
            tooltip: 'Open Cart',
            shape: CircleBorder(),
            onPressed: () => Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
                    ),
                  ),
                  child: CartPage(),
                ),
              ),
            ),
            child: Icon(
              Icons.shopping_bag,
            ),
          ),
          Positioned(
            bottom: 1,
            right: 1,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Consumer<CartItemList>(
                builder: (context, value, child) => Text(
                  '${value.cartList.length}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
