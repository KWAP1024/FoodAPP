// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, prefer_typing_uninitialized_variables, constant_identifier_names, curly_braces_in_flow_control_structures, avoid_print, unnecessary_null_comparison, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:resturant/Navigation/homepage.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
}

class Super extends StatefulWidget {
  const Super({Key? key}) : super(key: key);

  @override
  _SuperState createState() => _SuperState();
}

class _SuperState extends State<Super> {
  List listOfFacts = [];
  Future fetchData() async {
    http.Response response;
    const API_URL = 'https://precision-air.herokuapp.com/super.php';
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
        backgroundColor: Colors.green.shade900,
        automaticallyImplyLeading: false,
        title: Text(
          'SUPER MARKET',
          style: TextStyle(color: Colors.white),
        ),
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
        centerTitle: true,
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
                cursorColor: Colors.green.shade900,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green.shade900),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green.shade900),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  fillColor: Colors.green.shade900,
                  hoverColor: Colors.green.shade900,
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
