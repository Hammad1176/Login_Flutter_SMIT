import 'package:flutter/material.dart';
import 'package:login_project/Utils/colors.dart';



class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<String> category = [
    "T_shirt ",
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
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: category.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(10),
          height: 50,
          color: ColorCustom.prinmary,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
          child: Text(category[index]),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
