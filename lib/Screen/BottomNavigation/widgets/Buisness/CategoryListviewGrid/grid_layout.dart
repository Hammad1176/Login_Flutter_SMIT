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
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      // ignore: avoid_types_as_parameter_names
      itemBuilder: (BuildContext, index) {
        return Container(
          margin: const EdgeInsets.all(5),
          width: 80,
          height: 500,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity, //double.infinity
                height: 100,
                child: Image.network(
                  BuissnesList.list[index],
                  fit: BoxFit.fill,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Shirts ",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dollar Amount"),
                    Icon(Icons.shopping_cart_outlined)
                  ],
                ),
              )
            ],
          ),
        );
      });
}
