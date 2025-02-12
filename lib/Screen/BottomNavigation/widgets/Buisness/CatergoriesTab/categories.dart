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
    "hoddie",
    "Electronics",
    "T-shirt",
    " Shirts ",
    "Pent ",
    "hoddie",
    "Electronics"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 180,
      margin: const EdgeInsets.only(top: 5, left: 2),
      decoration: const BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        // padding: const EdgeInsets.all(5),
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
                padding: _selectedTab == index
                    ? const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 5)
                    : const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 5),
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _selectedTab == index
                      ? ColorCustom.tabAcitveColor
                      : ColorCustom.tabUnAcitveColor,
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                ),
                child: Column(
                  children: [
                    Text(
                      category[index],
                      style: TextStyle(
                        fontWeight: _selectedTab == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 3,
                      width: MediaQuery.of(context).size.width * 0.08,
                      decoration: BoxDecoration(
                          color: _selectedTab == index
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
              ));
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
