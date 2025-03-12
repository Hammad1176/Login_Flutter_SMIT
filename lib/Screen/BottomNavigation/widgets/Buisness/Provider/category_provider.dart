// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:login_project/Modal/buissnes_list.dart';

class CategoryProvider extends ChangeNotifier {
  final List<BuissnesList> _fav = [];
  List<BuissnesList>? get Fav => _fav;

  int _selectCategory = 0;

  int get selectedCategory => _selectCategory;

  final List<BuissnesList> _addToCart = [];

  //search
  List<BuissnesList> _searchList = [];
  List<BuissnesList> get searchList => _searchList;

  // check filter
  void resetSearch() {
    _isFilter = false;
    _searchList.clear();
    notifyListeners();
  }

  bool _isFilter = false;
  bool get isFilter => _isFilter;

  List<BuissnesList> get addToCart {
    return _addToCart;
  }

  double _totalAmount = 0;

  double get totalAmount => _totalAmount;

//increment qty
  addQty(BuissnesList data, int index) {
    final boolCheck = addToCart.contains(data);
    if (_addToCart.contains(data)) {
      //&& index < _addToCart.length

      final check = _addToCart[index].quantity++;

      // data.quantity++;
      notifyListeners();
    }
  }

  //decreament Qty
  decQty(BuissnesList data, int index) {
    if (_addToCart.contains(data)) {
      if (_addToCart[index].quantity > 1) {
        _addToCart[index].quantity = _addToCart[index].quantity - 1;
        notifyListeners();
      }
    }
  }

  addTOCart(BuissnesList buisnessList) {
    if (_addToCart.contains(buisnessList)) {
      _addToCart.remove(buisnessList);
      notifyListeners();
    } else {
      _addToCart.add(buisnessList);
      buisnessList.quantity++;
      notifyListeners();
    }

    // Ensure the quantity is updated correctly
    if (!_addToCart.contains(buisnessList)) {
      buisnessList.quantity = 1; // Reset quantity when added
    }
  }

  // category tap
  setindex({required int index}) {
    _selectCategory = index;
    notifyListeners();
  }

  // set fav list
  void setFav(BuissnesList favData) {
    if (_fav.contains(favData)) {
      _fav.remove(favData);
      notifyListeners();
    } else {
      _fav.add(favData);
      notifyListeners();
    }
  }

  searchQuery(String query) {
    resetSearch(); // Reset search state when a new query is made

    _isFilter = false;
    _searchList.clear();
    notifyListeners();

    // Clear previous search results
    for (var productList in BuissnesList.productList) {
      var matches = productList
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      if (matches.isNotEmpty) {
        _isFilter = true;
        _searchList.addAll(matches);
        notifyListeners();
      }
    }
  }

  //delet add to card data
  deleteItem(int index) {
    _addToCart.removeAt(index);
    notifyListeners();
  }

  checkADDTotalValue() {
    if (addToCart.isEmpty) {
      _totalAmount = 0;
    } else {
      for (var i in addToCart) {
        final total = i.price * i.quantity;

        _totalAmount += total;
      }
      notifyListeners();
    }
  }

  checkDecTotalValue() {
    if (addToCart.isEmpty) {
      _totalAmount = 0;
    } else {
      for (var i in addToCart) {
        if (i.quantity > 1) {
          final total = i.price * i.quantity;

          _totalAmount -= total;
        }
        notifyListeners();
      }
    }
  }
}
