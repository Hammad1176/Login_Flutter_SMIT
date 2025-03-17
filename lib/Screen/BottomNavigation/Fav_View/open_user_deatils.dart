// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_project/Modal/buissnes_list.dart';
import 'package:login_project/Screen/BottomNavigation/Provider/category_provider.dart';
import 'package:provider/provider.dart';

class OpenProductDetails extends StatefulWidget {
  final String product_name;

  final String product_url;

  double product_price;
  BuissnesList list;

  OpenProductDetails({
    super.key,
    required this.product_name,
    required this.product_url,
    required this.product_price,
    required this.list,
  });

  @override
  State<OpenProductDetails> createState() => _OpenProductDetailsState();
}

class _OpenProductDetailsState extends State<OpenProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.product_url,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                width: double.infinity,
                child: Image.network(
                  widget.product_url,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.red,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.product_name,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "PKR : ${widget.product_price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  //on sale

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber[100],
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            'assets/images/tag.svg',
                            height: 16,
                            width: 16,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "On sale ",
                            style: TextStyle(color: Colors.amber),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            //Descrip
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "Decription",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                  "Elevate your everyday style with this comfortable and stylish cotton shirt. Made from 100% cotton, this shirt features a relaxed fit that drapes elegantly on the body. The soft fabric ensures that you stay comfortable throughout the day, whether you're running errands or meeting with friends."),
            ),
            //sepecification
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 5),
              child: Text(
                "Specification",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text("Color: deafualt \nSize: Medium \nDelivery: 8 hours"),
            ),
            const SizedBox(
              height: 30,
            ),
            ByNow(business_list: widget.list)
          ],
        ),
      ),
    );
  }
}

class ByNow extends StatefulWidget {
  BuissnesList business_list;
  ByNow({super.key, required this.business_list});

  @override
  State<ByNow> createState() => _ByNowState();
}

class _ByNowState extends State<ByNow> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CategoryProvider>(context);
    BuissnesList business_list = widget.business_list;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // add qty and reduce qty
        Container(
          decoration: BoxDecoration(
              // color: Colors.green,
              border: Border.all(
                color: Colors.amber,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.amber,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                udateQtydata(data, business_list),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.remove,
                  color: Colors.amber,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // by now
        Container(
          decoration: BoxDecoration(
              color: Colors.amber[400],
              borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/images/Add Item Cart.svg',
                  height: 16,
                  width: 16,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "By Now ",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  udateQtydata(
    CategoryProvider provider,
    BuissnesList business_list,
  ) {
    // provider.addToCartList(business_list);
    int index =
        provider.addToCart.indexWhere((e) => e.image == business_list.image);

    return Text(
      index == -1 ? "1data" : provider.addToCart[index].quantity.toString(),
    );
  }
}
