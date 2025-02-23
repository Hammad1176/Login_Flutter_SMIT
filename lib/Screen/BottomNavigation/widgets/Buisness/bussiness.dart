import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/Buisness/CategoryListviewGrid/grid_layout.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/Buisness/CatergoriesTab/categories.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/Buisness/Provider/category_provider.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/Buisness/slider/slider.dart';
import 'package:provider/provider.dart';

class MyBussinessScreen extends StatefulWidget {
  const MyBussinessScreen({super.key});

  @override
  State<MyBussinessScreen> createState() => _MyBussinessScreenState();
}

class _MyBussinessScreenState extends State<MyBussinessScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("builde buisness screen ");
    return ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
      child: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFFfae8e0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  //appar
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                              color: Color(0XFFd6c7c0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
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
                  ),
                  //search bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 20),
                        width: double.infinity,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Color(0XFFfcefea),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border()),
                        child: const TextField(
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.grey),
                          autofocus: false,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 5),
                            hintText: "Search",
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //slider pages
                  SizedBox(width: double.infinity, child: SliderPage(context)),

                  // category list sateful with provider
                  const SizedBox(
                    width: double.infinity,
                    child: CategoriesList(),
                  ),

                  // create grid screen pass category index and set the value of category wise data
                  const Expanded(child: GridScreen()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
