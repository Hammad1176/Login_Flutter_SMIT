// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_project/Utils/colors.dart';

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
        children: [
          Hero(
            tag: product_url,
            child: SizedBox(
              height: 350,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(product_name,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      "PKR : $product_price",
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
                      color: Colors.lightGreen[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        'assets/images/tag.svg',
                        height: 16,
                        width: 16,
                        fit: BoxFit.contain,
                      ),
                      Text("data"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
