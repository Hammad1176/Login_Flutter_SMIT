// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:login_project/Modal/buissnes_list.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    //
    return ClassName.getGrid(contex: context);
  }
}

class ClassName {
  static Widget getGrid({int? index, BuildContext? contex}) => GridView.builder(
      itemCount: BuissnesList.list.length,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // physics: const NeverScrollableScrollPhysics(),
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          mainAxisExtent: 250),
      // ignore: avoid_types_as_parameter_names
      itemBuilder: (BuildContext, index) {
        return Container(
          margin: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  height: MediaQuery.of(BuildContext).size.height * 0.20,
                  width: MediaQuery.of(BuildContext).size.width,
                  BuissnesList.list[index],
                  fit: BoxFit.fill,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Shirts ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ 20",
                      style: TextStyle(color: Colors.grey[350]),
                    ),
                    const Icon(Icons.shopping_cart_outlined)
                  ],
                ),
              )
            ],
          ),
        );
      });
}
