// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:login_project/Modal/buissnes_list.dart';

class CategoryProvider extends ChangeNotifier {
  final List<BuissnesList> _fav = [];
  List<BuissnesList>? get fav => _fav;

  int _selectCategory = 0;

  int get selectedCategory => _selectCategory;

  final List<BuissnesList> _addToCart = [];

  //search

  // check filter

  List<BuissnesList> get addToCart {
    return _addToCart;
  }

//increment qty
  addQty(BuissnesList data, int index) async {
    print(
        "Adding quantity for item: ${data.name}, current quantity: ${data.quantity}");

    // if (_addToCart.contains(data)) {
    //&& index < _addToCart.length

    _addToCart[index].quantity = _addToCart[index].quantity + 1;

    notifyListeners();

    // data.quantity++;
    // notifyListeners();
    // }
  }

  //decreament Qty
  decQty(BuissnesList data, int index) async {
    print(
        "Decreasing quantity for item: ${data.name}, current quantity: ${data.quantity}");

    // if (_addToCart.contains(data)) {
    if (_addToCart[index].quantity > 1) {
      // ignore: await_only_futures
      _addToCart[index].quantity = await _addToCart[index].quantity - 1;
      notifyListeners();

      //
      // }
    }
  }

  addToCartList(BuissnesList buisnessList) {
    if (_addToCart.contains(buisnessList)) {
      _addToCart.remove(buisnessList);
      notifyListeners();
    } else {
      _addToCart.add(buisnessList);
      // buisnessList.quantity++;
      notifyListeners();
    }
    notifyListeners();

    // Ensure the quantity is updated correctly
    // buisnessList.quantity = 1; // Reset quantity when added
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
    notifyListeners();
  }

  List<BuissnesList> _searchList = [];
  List<BuissnesList> get searchFilter => _searchList;

  searchQuery(String query) async {
    // Reset search state when a new query is made

    if (query.isEmpty) {
      _searchList.clear();
      notifyListeners();
    } else {
      _searchList.clear();
      notifyListeners();
      for (var productList in BuissnesList.productList) {
        var matches = await productList
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()) ||
                element.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
        if (matches.isNotEmpty) {
          _searchList.addAll(matches);

          notifyListeners();
        }
      }
    }
    // Clear previous search results
  }

  //delet add to card data
  deleteItem(int index) {
    print("Deleting item at index: $index, item: ${_addToCart[index].name}");

    _addToCart.removeAt(index);
    notifyListeners();
  }

  double totalAmount() {
    double total = 0;
    for (var element in _addToCart) {
      double data = element.price * element.quantity;
      total += data;
      // print("check total row wise element amount ${element.quantity} ");
    }
    return total;
  }

  rowTotal(List<BuissnesList> list, int index) async {
    double total = list[index].price * list[index].quantity;
    _addToCart[index].total = await total;
    // print("check total row wise element amount $total ");
    notifyListeners();
  }
}
