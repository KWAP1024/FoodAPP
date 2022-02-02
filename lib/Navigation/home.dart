// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:resturant/Screens/profile.dart';
import 'package:resturant/Navigation/homepage.dart';
import 'package:resturant/super/supermarket.dart';

class Home extends StatefulWidget {
  const Home(String text, {Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 1;
  final Screen = [
    Super(),
    Homepage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            body: Screen[index],
            extendBody: true,
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.amber,
              unselectedItemColor: Colors.black,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.history), label: 'Super\nMarket'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Resturant'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_pin), label: 'Settings'),
              ],
              currentIndex: index,
              onTap: (index) {
                if (mounted) setState(() => this.index = index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
