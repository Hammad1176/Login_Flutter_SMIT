import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/Buisness/CategoryListviewGrid/grid_layout.dart';
import 'package:login_project/Utils/colors.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int _selectedTab = 0;
  List<String> category = [
    "T-shirt",
    " Shirts ",
    "Pent ",
    "T_shirt ",
    " Shirts ",
    "Pent ",
    "T_shirt ",
    " Shirts ",
    "Pent "
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 2),
      decoration: const BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = index;
                   ClassName.getGrid(index: index);
                });
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                height: 5,
                decoration: BoxDecoration(
                  color: _selectedTab == index
                      ? ColorCustom.tabAcitveColor
                      : ColorCustom.tabUnAcitveColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  category[index],
                  style: TextStyle(
                    fontWeight: _selectedTab == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ));
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

