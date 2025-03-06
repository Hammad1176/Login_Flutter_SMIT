import 'package:flutter/material.dart';
import 'package:login_project/Modal/buissnes_list.dart';

class CategoryProvider extends ChangeNotifier {
  final List<BuissnesList>? _fav = [];
  List<BuissnesList>? get Fav => _fav;

  int _selectCategory = 0;

  int get selectedCategory => _selectCategory;

  final List<BuissnesList> _addToCart = [];

  List<BuissnesList> get addToCart {
    return _addToCart;
  }

  addQty(BuissnesList data, int index) {
    if (_addToCart.contains(data)) {
      data.quantity++;
      notifyListeners();
    }
  }

  addTOCart(BuissnesList buisnessList) {
    if (_addToCart.contains(buisnessList)) {
      _addToCart.remove(buisnessList);
      notifyListeners();
    } else {
      _addToCart.add(buisnessList);
      buisnessList.quantity = buisnessList.quantity++;
      notifyListeners();
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
