import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:login_project/Modal/buissnes_list.dart';
import 'package:login_project/Screen/BottomNavigation/Buisness/Buisness/WIdgets/grid_layout.dart';
import 'package:login_project/Screen/BottomNavigation/Provider/category_provider.dart';
import 'package:login_project/Utils/colors.dart';
import 'package:provider/provider.dart';

class ProductFilter{

static filterList(List<BuissnesList> getData, BuildContext context) {
  return GridView.builder(
      itemCount: getData.length - 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          mainAxisExtent: MediaQuery.of(context).size.height * 0.32),
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      itemBuilder: (BuildContext, getIndex) {
        final provider = Provider.of<CategoryProvider>(context);
        final data = getData[getIndex];
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
                    child: CachedNetworkImage(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      imageUrl: checkUril(data.image), //getData[getIndex]
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        color: ColorCustom.tabAcitveColor,
                      )),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          provider.setFav(data);
                        },
                        icon: Icon(Icons.favorite,
                            color: provider.fav!.contains(data)
                                ? Colors.red
                                : Colors.grey)),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  getData[getIndex].name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "PKR:${data.price}",
                      style: TextStyle(
                          color: Colors.grey[400], fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      // ignore: avoid_print
                      onTap: () {
                        provider.addToCartList(data);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.only(left: 18),
                        child: provider.addToCart.contains(data)
                            ? const Icon(Icons.check)
                            : Stack(
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
                                      decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(80))),
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



}