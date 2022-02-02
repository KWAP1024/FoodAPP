// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, prefer_typing_uninitialized_variables, constant_identifier_names, curly_braces_in_flow_control_structures, avoid_print, unnecessary_null_comparison, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:resturant/butcher/butcher.dart';
import 'package:resturant/menu_reader.dart';
import 'package:resturant/resturant/tspecial.dart';
import 'package:resturant/super/supermarket.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List listOfFacts = [];
  Future fetchData() async {
    http.Response response;
    const API_URL = 'https://precision-air.herokuapp.com/ads.php';
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
        title: Text('changable title'),
        centerTitle: true,
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            backgroundColor: Colors.amber,
            child: Icon(Icons.restaurant_sharp),
            label: 'Resturant',
            labelBackgroundColor: Colors.amber,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Tspecial(),
                  ));
            },
          ),
          SpeedDialChild(
            backgroundColor: Colors.green.shade900,
            child: Icon(FontAwesomeIcons.shoppingCart),
            label: 'Super Market',
            labelBackgroundColor: Colors.green.shade900,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Super(),
                  ));
            },
          ),
          SpeedDialChild(
            backgroundColor: Colors.blue.shade500,
            child: Icon(FontAwesomeIcons.book),
            label: 'View Menu',
            labelBackgroundColor: Colors.blue.shade500,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Menu(),
                  ));
            },
          ),
          SpeedDialChild(
            backgroundColor: Colors.red.shade900,
            child: Icon(FontAwesomeIcons.fish),
            label: 'Butcher',
            labelBackgroundColor: Colors.red.shade900,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Butcher(),
                  ));
            },
          )
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
    );
  }
}
