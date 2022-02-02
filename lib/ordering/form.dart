// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable, curly_braces_in_flow_control_structures, constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Form1 extends StatefulWidget {
  var name;
  Form1({Key? key, required this.name}) : super(key: key);

  @override
  _Form1State createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  var type;
  List listOfFacts = [];
  Future fetchData() async {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: TextFormField(
                  cursorColor: Colors.grey.shade500,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    fillColor: Colors.black,
                    hoverColor: Colors.black,
                    focusColor: Colors.black,
                    hintText: 'Available phone number',
                  ),
                  maxLength: 13,
                  // keyboardType: TextInputType.phone,
                  // controller: u,
                  validator: (value) {
                    // if (value!.isNotEmpty) {
                    //   return null;
                    // } else if (value.isEmpty) {
                    //   return 'Username is Empty';
                    // }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  cursorColor: Colors.grey.shade500,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    fillColor: Colors.amber,
                    hoverColor: Colors.amber,
                    focusColor: Colors.grey.shade400,
                    hintText: 'Location',
                  ),
                  maxLength: 13,
                  // keyboardType: TextInputType.phone,
                  // controller: p,
                  validator: (value) {
                    // if (value!.isNotEmpty) {
                    //   return null;
                    // } else if (value.isEmpty) {
                    //   return 'Password is Empty';
                    // }
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  cursorColor: Colors.grey.shade500,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    fillColor: Colors.amber,
                    hoverColor: Colors.amber,
                    focusColor: Colors.grey.shade400,
                    hintText: 'Number of Orders',
                  ),
                  maxLength: 13,
                  // keyboardType: TextInputType.phone,
                  // controller: p,
                  validator: (value) {
                    // if (value!.isNotEmpty) {
                    //   return null;
                    // } else if (value.isEmpty) {
                    //   return 'Password is Empty';
                    // }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  readOnly: true,
                  cursorColor: Colors.grey.shade500,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    fillColor: Colors.amber,
                    hoverColor: Colors.amber,
                    focusColor: Colors.grey.shade400,
                    hintText: widget.name,
                  ),
                  maxLength: 13,
                  // keyboardType: TextInputType.phone,
                  // controller: p,
                  validator: (value) {
                    // if (value!.isNotEmpty) {
                    //   return null;
                    // } else if (value.isEmpty) {
                    //   return 'Password is Empty';
                    // }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 55,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(25)),
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_downward),
                    style: TextStyle(color: Colors.black, fontSize: 22),
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text(
                      'Select Drink *OPTIONAL',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    value: type,
                    onChanged: (value) {
                      setState(() {
                        type = value;
                      });
                    },
                    items: listOfFacts.map((list) {
                      return DropdownMenuItem(
                        value: list['drinkname'].toString(),
                        child: Text(list['drinkname'].toString()),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                width: 365,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.amber,
                  ),
                  height: 55,
                  child: IconButton(
                    color: Colors.amber,
                    focusColor: Colors.amber,
                    highlightColor: Colors.amber,
                    hoverColor: Colors.amber,
                    onPressed: () {},
                    icon: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Text(
                            'SUBMIT ORDER',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.send,
                              color: Colors.amber,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   color: Colors.grey.shade400.withOpacity(0.6),
              //   child: Image.asset(
              //     'assets/image5.jfif',
              //     fit: BoxFit.fitWidth,
              //     width: 450,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
