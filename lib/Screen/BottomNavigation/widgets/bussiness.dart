import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/CatergoriesTab/categories.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/bottom/slider/slider.dart';

class MyBussinessScreen extends StatefulWidget {
  const MyBussinessScreen({super.key});

  @override
  State<MyBussinessScreen> createState() => _MyBussinessScreenState();
}

class _MyBussinessScreenState extends State<MyBussinessScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFfae8e0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //appar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      color: Color(0XFFd6c7c0),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/63358643?v=4",
                      scale: 10),
                )
              ],
            ),
            //search bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  width: double.infinity,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color(0XFFfcefea),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border()),
                  child: const TextField(
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black),
                    autofocus: false,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.5,
                                strokeAlign: BorderSide.strokeAlignInside))),
                  )),
            ),
            SliderPage(context),
            // ignore: prefer_const_constructors

            const SizedBox(
              width: double.infinity,
              height: 100,
              child: CategoriesList(),
            )
          ],
        ),
      ),
    );
  }
}
