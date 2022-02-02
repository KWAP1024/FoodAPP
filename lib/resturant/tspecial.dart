// ignore_for_file: curly_braces_in_flow_control_structures, constant_identifier_names, avoid_print, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:resturant/ordering/data.dart';
import 'package:resturant/resturant/Categories.dart';
import 'package:resturant/resturant/drinks.dart';
import 'package:resturant/Navigation/homepage.dart';
import 'package:resturant/resturant/visinia.dart';

class Tspecial extends StatefulWidget {
  const Tspecial({Key? key}) : super(key: key);

  @override
  _TspecialState createState() => _TspecialState();
}

class _TspecialState extends State<Tspecial> {
  List listOfFacts = [];
  Future fetchData() async {
    http.Response response;
    const API_URL = 'https://precision-air.herokuapp.com/tspecial.php';
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
          title: Text('Changable name'),
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
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                cursorColor: Colors.amber,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  fillColor: Colors.amber,
                  hoverColor: Colors.amber,
                  focusColor: Colors.grey.shade400,
                  hintText: 'Search Food',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
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
                                listOfFacts[index]['foodname'],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Data(
                                    amount: listOfFacts[index]['amount'],
                                    description: listOfFacts[index]
                                        ['description'],
                                    image: listOfFacts[index]['image'],
                                    name: listOfFacts[index]['foodname'],
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
          ]),
        ));
  }
}
