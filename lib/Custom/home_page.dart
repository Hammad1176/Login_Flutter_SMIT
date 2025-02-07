import 'package:flutter/material.dart';
import 'package:login_project/bottom/bussiness.dart';
import 'package:login_project/bottom/home.dart';
import 'package:login_project/bottom/school.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelected = 0;
  List<Widget> ctmWidget = [HomeScreen(), MyBussinessScreen(), SchoolScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ctmWidget[isSelected]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: isSelected,
        selectedItemColor: Colors.amber[800],
        onTap: (value) {
          // ignore: avoid_print
          print("index $value");
          isSelected = value;
          // ignore: avoid_print
          print("is selected $isSelected");
          setState(() {});
        },
      ),
    );
  }
}
