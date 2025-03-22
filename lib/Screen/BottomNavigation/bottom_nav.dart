// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/Provider/category_provider.dart';
import 'package:login_project/Screen/BottomNavigation/Buisness/Buisness/shopping.dart';
import 'package:login_project/Screen/BottomNavigation/Fav_View/fav.dart';
import 'package:login_project/Screen/BottomNavigation/AddToCart/add_to_cart.dart';
import 'package:badges/badges.dart' as badges;
import 'package:login_project/Utils/colors.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int isSelected = 1;
  List<Widget> producBottomWidgets = [
    const FavScreen(),
    const ShoppingScreen(),
    const AddTOCardScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
        body: SafeArea(child: producBottomWidgets[isSelected]),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              isSelected = value;
            });
          },
          height: 60,
          animationDuration: const Duration(seconds: 2),
          indicatorColor: Colors.brown[200],
          backgroundColor: ColorCustom.background,
          surfaceTintColor: Colors.green,
          // elevation: 4,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: <Widget>[
            NavigationDestination(
              icon: categoryProvider.fav!.isEmpty
                  ? const Icon(Icons.favorite_border_outlined)
                  : badgeIcon(categoryProvider.fav!.length.toString(),
                      const Icon(Icons.favorite_border_outlined)),
              selectedIcon: const Icon(Icons.favorite),
              label: 'Favourit List',
            ),
            const NavigationDestination(
              icon: Icon(Icons.shopping_bag_outlined),
              selectedIcon: Icon(Icons.shopping_bag),
              label: 'Shopping',
            ),
            NavigationDestination(
              icon: categoryProvider.addToCart.isEmpty
                  ? const Icon(Icons.shopping_cart_outlined)
                  : badgeIcon(categoryProvider.addToCart.length.toString(),
                      const Icon(Icons.shopping_cart_outlined)),
              selectedIcon: const Icon(Icons.shopping_cart),
              label: 'Add To Cart',
            ),
          ],
          selectedIndex: isSelected,
        ));
  }
}

Widget badgeIcon(String numberOfItems, Icon icon) {
  return badges.Badge(
    position: badges.BadgePosition.topEnd(top: -10, end: -12),
    badgeContent: Text(
      "$numberOfItems",
      style: const TextStyle(fontSize: 10),
    ),
    badgeAnimation: const badges.BadgeAnimation.rotation(
      animationDuration: Duration(seconds: 1),
      colorChangeAnimationDuration: Duration(seconds: 1),
      loopAnimation: false,
      curve: Curves.fastOutSlowIn,
      colorChangeAnimationCurve: Curves.easeInCubic,
    ),
    child: icon,
  );
}


// BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: categoryProvider.fav!.isEmpty
//                 ? const Icon(Icons.favorite)
//                 : badges.Badge(
//                     position: badges.BadgePosition.topEnd(top: -10, end: -12),
//                     badgeContent: Text(
//                       "${categoryProvider.fav!.length.toString()}",
//                       style: const TextStyle(fontSize: 10),
//                     ),
//                     badgeAnimation: const badges.BadgeAnimation.rotation(
//                       animationDuration: Duration(seconds: 1),
//                       colorChangeAnimationDuration: Duration(seconds: 1),
//                       loopAnimation: false,
//                       curve: Curves.fastOutSlowIn,
//                       colorChangeAnimationCurve: Curves.easeInCubic,
//                     ),
//                     showBadge: categoryProvider.fav!.isEmpty ? false : true,
//                     child: const Icon(Icons.favorite),
//                   ),
//             label: 'Favourit List',
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_bag_outlined),
//             label: 'Shopping',
//           ),
//           BottomNavigationBarItem(
//             icon: categoryProvider.addToCart.isEmpty
//                 ? const Icon(Icons.shopping_cart_outlined)
//                 : badges.Badge(
//                     position: badges.BadgePosition.topEnd(top: -10, end: -12),
//                     badgeContent: Text(
//                       "${categoryProvider.addToCart.length.toString()}",
//                       style: const TextStyle(fontSize: 10),
//                     ),
//                     badgeAnimation: const badges.BadgeAnimation.rotation(
//                       animationDuration: Duration(seconds: 1),
//                       colorChangeAnimationDuration: Duration(seconds: 1),
//                       loopAnimation: false,
//                       curve: Curves.fastOutSlowIn,
//                       colorChangeAnimationCurve: Curves.easeInCubic,
//                     ),
//                     child: const Icon(Icons.shopping_cart_outlined),
//                   ),
//             label: 'Add To Cart',
//           ),
//         ],
//         currentIndex: isSelected,
//         selectedItemColor: Colors.amber[800],
//         unselectedItemColor: Colors.blue,
//         onTap: (value) {
//           // ignore: avoid_print
//           print("index $value");
//           isSelected = value;
//           // ignore: avoid_print
//           print("is selected $isSelected");
//           setState(() {});
//         },
//       ),

// badges.Badge(
//                       position: badges.BadgePosition.topEnd(top: -10, end: -12),
//                       badgeContent: Text(
//                         "${categoryProvider.addToCart.length.toString()}",
//                         style: const TextStyle(fontSize: 10),
//                       ),
//                       badgeAnimation: const badges.BadgeAnimation.rotation(
//                         animationDuration: Duration(seconds: 1),
//                         colorChangeAnimationDuration: Duration(seconds: 1),
//                         loopAnimation: false,
//                         curve: Curves.fastOutSlowIn,
//                         colorChangeAnimationCurve: Curves.easeInCubic,
//                       ),
//                       child: const Icon(Icons.shopping_cart_outlined),
//                     ),