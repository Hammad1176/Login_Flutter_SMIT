// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/Buisness/Provider/category_provider.dart';
import 'package:provider/provider.dart';

class OpenProductDetails extends StatelessWidget {
  final String product_name;

  final String product_url;

  double product_price;

  OpenProductDetails({
    super.key,
    required this.product_name,
    required this.product_url,
    required this.product_price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: product_url,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              width: double.infinity,
              child: Image.network(
                product_url,
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
                    Text(product_name,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "PKR : ${product_price.toStringAsFixed(2)}",
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
                        SizedBox(
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
                "Our compact and foldable Bluetooth earbuds are renowned for their lightweight build, offering a convenient and portable solution for audiophiles on the go"),
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
          ByNow(),
        ],
      ),
    );
  }
}

class ByNow extends StatefulWidget {
  const ByNow({super.key});

  @override
  State<ByNow> createState() => _ByNowState();
}

class _ByNowState extends State<ByNow> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CategoryProvider>(context);
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
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: Colors.amber,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("data"),
                SizedBox(
                  width: 10,
                ),
                Icon(
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
          color: Colors.amber[100], borderRadius: BorderRadius.circular(50)),
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
              style: TextStyle(color: Colors.amber),
            ),
          ],
        ),
      ),
    )
      ],
    );
  }
}
