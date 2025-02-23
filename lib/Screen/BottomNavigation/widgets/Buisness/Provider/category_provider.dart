import 'package:flutter/material.dart';
import 'package:login_project/Modal/buissnes_list.dart';
// import 'package:login_project/Modal/buissnes_list.dart';

class CategoryProvider extends ChangeNotifier {
  final _fav = [];
  // ignore: non_constant_identifier_names
  List get Fav => _fav;
  int _selectCategory = 0;

  int get selectedCategory => _selectCategory;

  // setCategoryIndex({required int selectedIndex}) {
  //   _selectCategory = selectedIndex;
  // }

  setindex({required int index}) {
    _selectCategory = index;
    notifyListeners();
  }

  void setFav(BuissnesList favData) {
    // ignore: avoid_print

    if (_fav.contains(favData)) {
      _fav.remove(favData);
      notifyListeners();
    } else {
      _fav.add(favData);
      notifyListeners();
    }
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