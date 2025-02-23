// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_interpolation_to_compose_strings

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
  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<CategoryProvider>(context);

    return GridView.builder(
        itemCount:
            BuissnesList.productList[getProvider.selectedCategory].length,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            mainAxisExtent: 250),
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
                            getProvider.setFav(BuissnesList
                                    .productList[getProvider.selectedCategory]
                                [getIndex]);
                          },
                          icon: Icon(Icons.favorite,
                              color: getProvider.Fav.contains(BuissnesList
                                          .productList[
                                      getProvider.selectedCategory][getIndex])
                                  ? Colors.red
                                  : Colors.grey

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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "PKR:" +
                            BuissnesList
                                .productList[getProvider.selectedCategory]
                                    [getIndex]
                                .price
                                .toString(),
                        // BuissnesList.productList[getIndex].price.toString(),
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500),
                      ),

                      //create cutom badge add to card

                      Container(
                        // color: Colors.amber,
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.only(left: 18),
                        child: Stack(
                          children: [
                            const Positioned(
                              top: 9,
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                size: 25,
                              ),
                            ),
                            Positioned(
                              left: 15,
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
  }

  // void setFavouritData(final providerdata, getIndex) {
  //   providerdata.setFav(
  //       BuissnesList.productList[providerdata.selectedCategory][getIndex]);
  // }
}
