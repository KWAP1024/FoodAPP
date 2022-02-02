// ignore_for_file: prefer_const_constructors, prefer_if_null_operators, prefer_typing_uninitialized_variables, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysql1/mysql1.dart';
import 'package:resturant/Navigation/home.dart';
import 'package:resturant/Navigation/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Loginv extends StatefulWidget {
  var phone;
  var location;
  var ordern;
  var name;
  var size;
  var type;
  Loginv({
    Key? key,
    required this.phone,
    required this.location,
    required this.ordern,
    required this.name,
    required this.size,
    required this.type,
  }) : super(key: key);

  

  @override
  _LoginvState createState() => _LoginvState();
}

class _LoginvState extends State<Loginv> {
  Future insert() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'us-cdbr-east-04.cleardb.com',
        port: 3306,
        user: 'bf15ab7159f988',
        db: 'heroku_a7874bf1ef4af48',
        password: 'ee55bd44'));

    var result = await conn.query(
        'insert into visiniaorders ( phone, location, odern, name, size, food) values (?, ?, ?, ?, ?, ?)',
        [
          widget.phone.toString(),
          widget.location.toString(),
          widget.ordern.toString(),
          widget.name.toString(),
          widget.size.toString(),
          widget.type.toString(),
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

  Future login() async {
    const url = 'https://precision-air.herokuapp.com/kwadulogin.php';
    var response = await http.post(Uri.parse(url), body: {
      "u": u.text,
      "p": p.text,
    });
    final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('u', u.text);
  }
  TextEditingController u = TextEditingController();
  TextEditingController p = TextEditingController();
 
  List listItem = ['English', 'Kiswahili'];
  var type;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 55,
              ),
              Center(child: Image.asset('assets/image3.jfif')),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 160, left: 15),
                    child: Text(
                      'LOGIN',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 00),
                    child: InkWell(
                      child: Text(
                        'NEW USER ? SIGNUP NOW',
                        style: TextStyle(color: Colors.grey[550], fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: TextFormField(
                  controller: u,
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
                    hintText: 'Username',
                    prefixIcon: Icon(
                      Icons.person_pin,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  maxLength: 13,
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
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: p,
                  cursorColor: Colors.grey.shade500,
                  obscureText: true,
                  obscuringCharacter: '*',
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
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock_sharp,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  maxLength: 13,
                  validator: (value1) {
                    if (value1!.isNotEmpty) {
                      return null;
                    } else if (value1.isEmpty) {
                      return 'Password is Empty';
                    }
                  },
                ),
              ),
              SizedBox(
                height: 15,
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
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => Home('')));
                    },
                    icon: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 110),
                          child: Text(
                            'LOGIN NOW',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
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
            ],
          ),
        ),
      ),
    );
  }
}
