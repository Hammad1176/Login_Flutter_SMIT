// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:login_project/Modal/buissnes_list.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/Buisness/Provider/category_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  int? _isFav;

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<CategoryProvider>(context);
    // final provider = Provider.of<CartProvider>(context , listen: false);

    // print(GridGetIndex.getIndexCategores());
    return GridView.builder(
        itemCount:
            BuissnesList.productList[getProvider.selectedCategory].length,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // physics: const NeverScrollableScrollPhysics(),
        // physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            mainAxisExtent: 280),
        // ignore: avoid_types_as_parameter_names
        itemBuilder: (BuildContext, getIndex) {
          return Container(
            margin: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        height: MediaQuery.of(BuildContext).size.height * 0.20,
                        width: MediaQuery.of(BuildContext).size.width,
                        BuissnesList
                            .productList[getProvider.selectedCategory][getIndex]
                            .image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            _isFav = getIndex;

                            setState(() {});
                          },
                          icon: Icon(Icons.favorite,
                              color:
                                  _isFav == getIndex ? Colors.red : Colors.grey

                              //  _isFav == getIndex ? Colors.red : Colors.grey,
                              )),
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    BuissnesList
                        .productList[getProvider.selectedCategory][getIndex]
                        .name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        BuissnesList
                            .productList[getProvider.selectedCategory][getIndex]
                            .price
                            .toString(),
                        // BuissnesList.productList[getIndex].price.toString(),
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),

                      //create cutom badge add to card

                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Stack(
                          children: [
                            const Positioned(
                              top: 5,
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                size: 25,
                              ),
                            ),
                            Positioned(
                              top: 0.5,
                              left: 10,
                              child: Container(
                                height: 15,
                                width: 15,
                                // color: Colors.red,
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(80))),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });

    // ClassName.getGrid(
    //   contex: context,
    // );
  }

// ignore: unused_element
}

// class GridGetIndex {
//   int? catIndex;
//   static void getIndexCategores({int? getIndex}) {
//     // ignore: unnecessary_this
//     catIndex = getIndex;
//   }
// }
