// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, constant_identifier_names, avoid_print, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:resturant/Navigation/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:resturant/butcher/beef.dart';
import 'package:resturant/butcher/chicken.dart';
import 'package:resturant/butcher/eggs.dart';
import 'package:resturant/butcher/fish.dart';

class Butcher extends StatefulWidget {
  const Butcher({Key? key}) : super(key: key);

  @override
  _ButcherState createState() => _ButcherState();
}

class _ButcherState extends State<Butcher> {
  List listOfFacts = [];
  Future fetchData() async {
    http.Response response;
    const API_URL = 'https://precision-air.herokuapp.com/adsbutcher.php';
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
        body: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(
          'BUTCHER',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Homepage()));
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
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
                              child: Image.network(
                                  listOfFacts[index]['image'].toString())),
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
    ));
  }
}
