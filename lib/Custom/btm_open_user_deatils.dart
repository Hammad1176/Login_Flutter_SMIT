import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OpenUserScreen extends StatelessWidget {
  List<Map<String, dynamic>> listDetails;
  int index;
  OpenUserScreen({super.key, required this.listDetails, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Image.network(listDetails[index]["Url"]),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(listDetails[index]["Fruit"]),
        ],
      )),
    );
  }
}
