// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OpenUserScreen extends StatelessWidget {
  String fruit_name ;
  String fruit_url;
  OpenUserScreen({super.key, required this.fruit_name , required this.fruit_url});

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
            child: Image.network(fruit_url),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(fruit_name ),
        ],
      )),
    );
  }
}
