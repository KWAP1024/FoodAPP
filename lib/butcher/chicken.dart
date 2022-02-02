// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names, curly_braces_in_flow_control_structures, constant_identifier_names, avoid_print, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:resturant/butcher/beef.dart';
import 'package:resturant/butcher/eggs.dart';
import 'package:resturant/butcher/fish.dart';

class Chicken extends StatefulWidget {
  const Chicken({Key? key}) : super(key: key);

  @override
  _ChickenState createState() => _ChickenState();
}

class _ChickenState extends State<Chicken> {
  List listOfFacts = [];
  Future fetchData() async {
    http.Response response;
    const API_URL = 'https://precision-air.herokuapp.com/categorychicken.php';
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
        backgroundColor: Colors.red.shade900,
        automaticallyImplyLeading: false,
        title: Text(
          'POULTRY',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      // drawer: Drawer(
      //   child: Container(
      //       // color: Colors.white,
      //       child: ListView(padding: EdgeInsets.zero, children: [
      //     const DrawerHeader(
      //       decoration: BoxDecoration(
      //         color: Colors.amber,
      //       ),
      //       // child: Icon(Icons.person,size: 10.0,color: Colors.black,),
      //       child: CircleAvatar(
      //         radius: 12,
      //         backgroundColor: Colors.white,
      //         backgroundImage: AssetImage('assets/splash.png'),
      //       ),
      //     ),
      //     ListTile(
      //         leading: const CircleAvatar(
      //           backgroundColor: Colors.amber,
      //           child: Icon(
      //             Icons.local_drink,
      //             color: Colors.white,
      //             // add custom icons also
      //           ),
      //         ),
      //         title: const Text('Drinks'),
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (_) => const Drinks(),
      //               ));
      //         }),
      //     ListTile(
      //         leading: const CircleAvatar(
      //           backgroundColor: Colors.amber,
      //           child: Icon(
      //             Icons.menu_book,
      //             color: Colors.white,
      //             // add custom icons also
      //           ),
      //         ),
      //         title: const Text('Visinia'),
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (_) => MainMenu(),
      //               ));
      //         }),
      //     ListTile(
      //         leading: const CircleAvatar(
      //           backgroundColor: Colors.amber,
      //           child: Icon(
      //             Icons.folder_special,
      //             color: Colors.white,
      //             // add custom icons also
      //           ),
      //         ),
      //         title: const Text('Today\'s special'),
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (_) => Tspecial(),
      //               ));
      //         }),
      //     ListTile(
      //       leading: const CircleAvatar(
      //         backgroundColor: Colors.amber,
      //         child: Icon(
      //           Icons.category_outlined,
      //           color: Colors.white,
      //           // add custom icons also
      //         ),
      //       ),
      //       title: const Text('Categories'),
      //       onTap: () {
      //         Navigator.pushReplacement(context,
      //             MaterialPageRoute(builder: (context) => Categories()));
      //       },
      //     ),
      //     ListTile(
      //       leading: const CircleAvatar(
      //         backgroundColor: Colors.amber,
      //         child: Icon(
      //           Icons.home_filled,
      //           color: Colors.white,
      //           // add custom icons also
      //         ),
      //       ),
      //       title: const Text('Home'),
      //       onTap: () {
      //         Navigator.pushReplacement(
      //             context, MaterialPageRoute(builder: (context) => Homepage()));
      //       },
      //     ),
      //   ])),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                cursorColor: Colors.red.shade900,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade900),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade900),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  fillColor: Colors.red.shade900,
                  hoverColor: Colors.red.shade900,
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
              height: 50,
            ),
            Wrap(
              children: [
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade900),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade900),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.red.shade900)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Fish(),
                          ));
                    },
                    child: Text(
                      'FISH',
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade900),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade900),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.red.shade900)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Beef(),
                          ));
                    },
                    child: Text(
                      'BEEF',
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade900),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade900),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.red.shade900)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Chicken(),
                          ));
                    },
                    child: Text(
                      'CHICKEN',
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade900),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade900),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.red.shade900)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Eggs(),
                          ));
                    },
                    child: Text(
                      'EGSS',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            listOfFacts.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 50),
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
                                      color: Colors.black,
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
