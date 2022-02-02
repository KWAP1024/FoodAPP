// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names, curly_braces_in_flow_control_structures, constant_identifier_names, avoid_print, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:resturant/resturant/drinks.dart';
import 'package:resturant/Navigation/homepage.dart';
import 'package:resturant/resturant/visinia.dart';
import 'package:resturant/resturant/tspecial.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List listOfFacts = [];
  Future fetchData() async {
    http.Response response;
    const API_URL = 'https://precision-air.herokuapp.com/categories.php';
    response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      if (mounted)
        setState(() {
          listOfFacts = json.decode(response.body);
        });
    } //
    print(listOfFacts);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Categories'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
            // color: Colors.white,
            child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            // child: Icon(Icons.person,size: 10.0,color: Colors.black,),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/splash.png'),
            ),
          ),
          ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.amber,
                child: Icon(
                  Icons.local_drink,
                  color: Colors.white,
                  // add custom icons also
                ),
              ),
              title: const Text('Drinks'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Drinks(),
                    ));
              }),
          ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.amber,
                child: Icon(
                  Icons.menu_book,
                  color: Colors.white,
                  // add custom icons also
                ),
              ),
              title: const Text('Visinia'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MainMenu(),
                    ));
              }),
          ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.amber,
                child: Icon(
                  Icons.folder_special,
                  color: Colors.white,
                  // add custom icons also
                ),
              ),
              title: const Text('Today\'s special'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Tspecial(),
                    ));
              }),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.amber,
              child: Icon(
                Icons.category_outlined,
                color: Colors.white,
                // add custom icons also
              ),
            ),
            title: const Text('Categories'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Categories()));
            },
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.amber,
              child: Icon(
                Icons.home_filled,
                color: Colors.white,
                // add custom icons also
              ),
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            },
          ),
        ])),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            listOfFacts.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 300),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    ),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        listOfFacts[index]['image'].toString()),
                                    fit: BoxFit.cover),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 300),
                                  child: Text(
                                    listOfFacts[index]['name'].toString(),
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )),
                          onTap: () {},
                        ),
                      );
                    },
                    itemCount: listOfFacts == null ? 0 : listOfFacts.length,
                  ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
