// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/Buisness/Buisness/WIdgets/grid_layout.dart';
import 'package:login_project/Screen/BottomNavigation/Buisness/Buisness/WIdgets/categories.dart';

import 'package:login_project/Screen/BottomNavigation/Buisness/Buisness/WIdgets/slider.dart';
import 'package:login_project/Screen/BottomNavigation/Provider/category_provider.dart';
import 'package:provider/provider.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  TextEditingController searchList = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<CategoryProvider>(context);
    print("builde buisness screen ");
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFFfae8e0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                //appar
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Color(0XFFd6c7c0),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/63358643?v=4",
                            scale: 10),
                      )
                    ],
                  ),
                ),
                //search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      width: double.infinity,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color(0XFFfcefea),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border()),
                      child: TextField(
                        onChanged: (value) {
                          getProvider.searchQuery(value);
                        },
                        controller: searchList,
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.grey),
                        autofocus: false,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 5),
                          hintText: "Search",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),

                //slider pages
                SizedBox(child: SliderPage(context)),

                // category list sateful with provider
                getProvider.searchFilter.isNotEmpty
                    ? Container()
                    : const SizedBox(
                        width: double.infinity,
                        child: CategoriesList(),
                      ),

                // create grid screen pass category index and set the value of category wise data
                const Expanded(child: GridScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
