import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_class_app/app_theme.dart';
import 'package:royal_class_app/app_theme_provider.dart';
import 'package:royal_class_app/modules/home/riverpod/provider/category_provider.dart';

import 'package:royal_class_app/modules/home/view/cart_view_page.dart';
import 'package:royal_class_app/modules/home/widget/category_widget.dart';
import 'package:royal_class_app/modules/home/widget/product_widget.dart';
import 'package:royal_class_app/support/common_widget./bottom_nav_bar_widget.dart';

import 'package:royal_class_app/support/providers/cart_provider.dart';
import 'package:royal_class_app/support/transition.dart';

import '../../../support/common_widget./search_bar.dart';
import 'package:badges/badges.dart' as badges;

// HomeScreenPage widget represents the main home screen of the app
class HomeScreenPage extends ConsumerWidget {
  const HomeScreenPage({super.key});

  // Static method to create a route for navigating to this page
  static Route route() {
    return AppFadeTransition(page: const HomeScreenPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch for changes in the app theme
    final isDarkMode = ref.watch(appThemeProvider);
    // ValueNotifier to keep track of the current page index for the carousel
    ValueNotifier<int> selectedCategoryIndex = ValueNotifier(0);
    ValueNotifier<String> selectedBottomIcon = ValueNotifier("cycle");

    return Scaffold(
      backgroundColor: colors(context).background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          // Leading icon button for user profile
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: colors(context).shadowColor,
              child: Icon(
                Icons.person,
                color: colors(context).text,
                size: 24,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: colors(context).background,
          // App logo in the title
          title: SizedBox(
            child: Image.asset("assets/images/logo.png"),
          ),
          // Actions in the app bar
          actions: [
            // Toggle dark mode button
            IconButton(
              onPressed: () {
                ref.read(appThemeProvider.notifier).state = !isDarkMode;
              },
              icon: isDarkMode
                  ? const Icon(
                      Icons.sunny,
                      color: Colors.amber,
                    )
                  : const Icon(
                      Icons.dark_mode,
                      color: Colors.white,
                    ),
            ),
            // Cart icon button with badge
            Consumer(builder: (context, ref, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -10, end: 0),
                  badgeContent: Text(
                      ref.watch(cartProvider.notifier).state.length.toString()),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, CartPage.route());
                    },
                    icon: Image.asset("assets/images/cart.png"),
                    color: Colors.white,
                    iconSize: 24,
                  ),
                ),
              );
            }),
          ],
          // Search bar widget at the bottom of the app bar
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: SearchBarWidget(onTap: () {
              // Navigator.push(context, SearchPage.route());
            }),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(activeIcon: "cycle"),
      // Main body of the home screen
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section title: Categories
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: colors(context).text),
                    ),
                  ),
                  // Category list widget
                  // Consumer(builder: (context, ref, child) {
                  //   var categoryList = ref.watch(categoryProvider);

                  //   return categoryList.when(data: (data) {
                  //     return CategoryListWidget(
                  //       categoryIndex: selectedCategoryIndex,
                  //       categoryList: data,
                  //     );
                  //   }, error: (e, s) {
                  //     return SizedBox();
                  //   }, loading: () {
                  //     return SizedBox();
                  //   });
                  ValueListenableBuilder(
                      valueListenable: selectedCategoryIndex,
                      builder: (context, val, child) {
                        return CategoryListWidget(
                          categoryIndex: selectedCategoryIndex,
                        );
                      }),
                  // }),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("Products in the selected Category",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: colors(context).text))),
                  ),
                  // Product list widget
                  const ProductListWidget()
                ],
              ),
            ),
          ),
          // Fade shadow widget for styling
          // const FadeShadowWidget()
        ],
      ),
    );
  }
}
