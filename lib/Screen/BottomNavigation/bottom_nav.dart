import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/bussiness.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/home.dart';
import 'package:login_project/Screen/BottomNavigation/widgets/school.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int isSelected = 0;
  List<Widget> ctmWidget = [
    const HomeScreen(),
    const MyBussinessScreen(),
    const SchoolScreen()
  ];
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
        unselectedItemColor: Colors.blue,
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
