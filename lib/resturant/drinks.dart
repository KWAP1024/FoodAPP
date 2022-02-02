// ignore_for_file: curly_braces_in_flow_control_structures, constant_identifier_names, prefer_const_constructors, unnecessary_null_comparison, avoid_print, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:resturant/ordering/ddata.dart';
import 'package:resturant/resturant/Categories.dart';
import 'package:resturant/Navigation/homepage.dart';
import 'package:resturant/resturant/visinia.dart';
import 'package:resturant/resturant/tspecial.dart';

class Drinks extends StatefulWidget {
  const Drinks({Key? key}) : super(key: key);

  @override
  _DrinksState createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
  List listOfFacts = [];
  Future fetchData2() async {
    http.Response response;
    const API_URL = 'https://precision-air.herokuapp.com/drinks.php';
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
    fetchData2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drinks'),
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
          )
        ])),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            listOfFacts.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          child: Card(
                              child: Column(
                            children: [
                              Image.network(
                                  listOfFacts[index]['image'].toString()),
                              Text(
                                listOfFacts[index]['drinkname'],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DData(
                                    amount: listOfFacts[index]['amount'],
                                    description: listOfFacts[index]
                                        ['description'],
                                    image: listOfFacts[index]['image'],
                                    name: listOfFacts[index]['drinkname'],
                                  ),
                                ));
                          },
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
