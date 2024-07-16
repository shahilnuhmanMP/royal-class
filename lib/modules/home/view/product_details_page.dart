import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royal_class_app/app_theme.dart';
import 'package:royal_class_app/support/common_widget./bottom_nav_bar_widget.dart';
import 'package:royal_class_app/support/common_widget./primary_button.dart';
import 'package:royal_class_app/support/constants.dart';
import 'package:royal_class_app/support/providers/cart_provider.dart';
import 'package:royal_class_app/support/transition.dart';

// ProductDetailsPage widget represents the page displaying details of a product
class ProductDetailsPage extends StatelessWidget {
  final String id; // ID of the product
  const ProductDetailsPage({super.key, required this.id});

  // Static method to create a route for navigating to this page
  static Route route({required String id}) {
    return AppFadeTransition(
        page: ProductDetailsPage(
      id: id,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Find the product from the list based on the provided ID
    Product product = products.firstWhere((element) => element.id == id);
    return Scaffold(
      backgroundColor: colors(context).background,
      appBar: AppBar(
        backgroundColor: colors(context).background,
        // Leading icon button for navigating back
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: colors(context).text,
          ),
        ),
        // Title of the page
        title: Text(
          product.name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: colors(context).text),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigation(activeIcon: ""),
      // Body of the page
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Product image
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: colors(context).primary!.withOpacity(0.2),
                ),
                child: Image.network(product.image, height: 200),
              ),
              // Product name
              Text(product.name),
              // Product price
              Text(
                "AED ${product.price.toString()}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: colors(context).text),
              ),
              // Product description
              Text(
                product.description,
                style: TextStyle(color: colors(context).text),
              ),
              const Spacer(),
              // Button to add product to cart
              Consumer(builder: (context, ref, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: PrimaryButton(
                    text: "Add to Cart",
                    onPressed: () {
                      ref.read(cartProvider.notifier).state.add(product.id);
                    },
                    color: colors(context).primary,
                  ),
                );
              }),
              // Button to buy the product now
              PrimaryButton(
                text: "Buy Now",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
