// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable, prefer_if_null_operators, curly_braces_in_flow_control_structures, avoid_print, constant_identifier_names, unused_local_variable, unused_element

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';
import 'package:resturant/authentcation/login.dart';
import 'package:resturant/Navigation/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VForm1 extends StatefulWidget {
  var name;
  var price;
  VForm1({Key? key, required this.name, required this.price}) : super(key: key);

  @override
  _VForm1State createState() => _VForm1State();
}

class _VForm1State extends State<VForm1> {
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

  var type1;
  List listOfFacts1 = [];
  Future fetchData1() async {
    http.Response response;
    const API_URL = 'https://precision-air.herokuapp.com/location.php';
    response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      if (mounted)
        setState(() {
          listOfFacts1 = json.decode(response.body);
        });
    } //
    print(listOfFacts1);
  }

  var size;
  List listItem = ['Small', 'Medium', 'Large'];

  var u;
  _navigatortohome() async {
    await getValidationData().whenComplete(() {
      if (u == null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Login(
                  phone: phone,
                  location: type1,
                  ordern: ordern,
                  name: name,
                  food: type,
                  size: size, price: widget.price, user: widget.name,
                )));
      } else {
        insert();
      }
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obatinphone = sharedPreferences.get('u');
    setState(() {
      u = obatinphone;
    });
    print(u);
  }

  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController ordern = TextEditingController();
  TextEditingController name = TextEditingController();

  Future insert() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'us-cdbr-east-04.cleardb.com',
        port: 3306,
        user: 'bf15ab7159f988',
        db: 'heroku_a7874bf1ef4af48',
        password: 'ee55bd44'));

    var result = await conn.query(
        'insert into normalorders ( phone, location, ordern, name, size, food, user, price) values (?, ?, ?, ?, ?, ?, ?, ?)',
        [
          phone.text,
          type1.toString(),
          ordern.text,
          widget.name,
          size.toString(),
          type.toString(),
          u.toString(),
          widget.price,
        ]);

    await conn.close();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Homepage()));
    Fluttertoast.showToast(
      msg: 'Order Submited Succefully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 15.0,
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchData1();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Text(
                'Please fill the form below',
                style: TextStyle(color: Colors.red, fontSize: 15),
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
                  keyboardType: TextInputType.phone,
                  controller: phone,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else if (value.isEmpty) {
                      return 'Username is Empty';
                    }
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
                      'Select Location',
                    ),
                    value: type1,
                    onChanged: (value) {
                      setState(() {
                        type1 = value;
                      });
                    },
                    items: listOfFacts1.map((list) {
                      return DropdownMenuItem(
                        value: list['location'].toString() +
                            '-' +
                            list['lprice'].toString(),
                        child: Text(list['location'].toString() +
                            '-' +
                            list['lprice'].toString()),
                      );
                    }).toList(),
                  ),
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
                  keyboardType: TextInputType.text,
                  controller: ordern,
                  validator: (value2) {
                    if (value2!.isNotEmpty) {
                      return null;
                    } else if (value2.isEmpty) {
                      return 'Password is Empty';
                    }
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
                ),
              ),
              SizedBox(
                height: 16,
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
                    hintText: widget.price.toString(),
                  ),
                  maxLength: 13,
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
                      'Size',
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 15),
                    ),
                    value: size,
                    onChanged: (newValue) {
                      setState(() {
                        size = newValue;
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(
                            valueItem != null ? valueItem : 'default value'),
                      );
                    }).toList(),
                  ),
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
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _navigatortohome();
                    },
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
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
