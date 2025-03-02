// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:login_project/Modal/buissnes_list.dart';
// import 'package:login_project/Modal/buissnes_list.dart';

class CategoryProvider extends ChangeNotifier {
  final List<BuissnesList>? _fav = [];
  // ignore: non_constant_identifier_names
  List<BuissnesList>? get Fav => _fav;

  int _selectCategory = 0;

  int get selectedCategory => _selectCategory;

  final List<BuissnesList> _addToCart = [];

  List<BuissnesList> get addToCart => _addToCart;

  addQty(BuissnesList data, int index) {
    if (_addToCart.contains(data)) {
      data.quantity! + 1;
      print("Productqtyyyy ${data.quantity! + 1}");
      notifyListeners();
      // print("Productqtyyyy ${product.qty}");
    }
  }

  addTOCart(BuissnesList buisnessList) {
    if (_addToCart.contains(buisnessList)) {
      // print("add to cart ${buisnessList.name}");
      notifyListeners();
    } else {
      _addToCart.add(buisnessList);
      buisnessList.quantity = buisnessList.quantity! + 1;
      notifyListeners();
      // print("add to cart ${buisnessList.name}");
    }
  }

// category tap
  setindex({required int index}) {
    _selectCategory = index;
    notifyListeners();
  }

// set fav list
  void setFav(BuissnesList favData) {
    if (_fav!.contains(favData)) {
      _fav.remove(favData);
      notifyListeners();
    } else {
      _fav.add(favData);
      notifyListeners();
    }
  }
}
