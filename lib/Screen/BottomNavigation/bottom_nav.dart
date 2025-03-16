// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/Provider/category_provider.dart';
import 'package:login_project/Screen/BottomNavigation/Buisness/Buisness/shopping.dart';
import 'package:login_project/Screen/BottomNavigation/Fav_View/fav.dart';
import 'package:login_project/Screen/BottomNavigation/AddTOCart/add_to_cart.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int isSelected = 0;
  List<Widget> ctmWidget = [
    const FavScreen(),
    const ShoppingScreen(),
    const AddTOCardScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      body: SafeArea(child: ctmWidget[isSelected]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: categoryProvider.Fav!.isEmpty
                ? const Icon(Icons.favorite)
                : badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -10, end: -12),
                    badgeContent: Text(
                      "${categoryProvider.Fav!.length.toString()}",
                      style: const TextStyle(fontSize: 10),
                    ),
                    badgeAnimation: const badges.BadgeAnimation.rotation(
                      animationDuration: Duration(seconds: 1),
                      colorChangeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    showBadge: categoryProvider.Fav!.isEmpty ? false : true,
                    child: const Icon(Icons.favorite),
                  ),
            label: 'Favourit List',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: categoryProvider.addToCart.isEmpty
                ? const Icon(Icons.shopping_cart_outlined)
                : badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -10, end: -12),
                    badgeContent: Text(
                      "${categoryProvider.addToCart.length.toString()}",
                      style: const TextStyle(fontSize: 10),
                    ),
                    badgeAnimation: const badges.BadgeAnimation.rotation(
                      animationDuration: Duration(seconds: 1),
                      colorChangeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    child: const Icon(Icons.shopping_cart_outlined),
                  ),
            label: 'Add To Cart',
          ),
        ],
        currentIndex: isSelected,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.blue,
        onTap: (value) {
          // ignore: avoid_print
          print("index $value");
          isSelected = value;
          // ignore: avoid_print
          print("is selected $isSelected");
          setState(() {});
        },
      ),
    );
  }
}
