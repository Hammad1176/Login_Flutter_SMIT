import 'package:flutter/material.dart';


class CategoryProvider extends ChangeNotifier {
  // int _index = 0;
  // int get index => _index;
  int _selectCategory = 0;

  int get selectedCategory => _selectCategory;

  setCategoryIndex({required int selectedIndex}) {
    _selectCategory = selectedIndex;
  }

  setindex({required int index}) {
    _selectCategory = index;
    notifyListeners();
  }
}


// final List<BuissnesList> _cartItems = [];

//   List<BuissnesList> get cartItems => _cartItems;

//   addCartItem(BuissnesList item) async {
//     _cartItems.add(item);

//     notifyListeners();
//     print("item");
//   }

//   removeCartItem(BuissnesList item) {
//     _cartItems.remove(item);
//     notifyListeners();
//   }