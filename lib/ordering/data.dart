// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resturant/ordering/formvisinia.dart';

class Data extends StatefulWidget {
  var image;
  var description;
  var name;
  var amount;
  Data({
    Key? key,
    required this.image,
    required this.description,
    required this.name,
    required this.amount,
  }) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                color: Colors.black,
                child: LimitedBox(
                    maxHeight: 400,
                    maxWidth: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(widget.image.toString()),
                    )),
              ),
            ),
            Divider(
              color: Colors.black,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              widget.name,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w900, fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Text(
                widget.description,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(widget.amount.toString()),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 165,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.amber,
                ),
                height: 45,
                child: IconButton(
                  color: Colors.amber,
                  focusColor: Colors.amber,
                  highlightColor: Colors.amber,
                  hoverColor: Colors.amber,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => VForm1(
                                  name: widget.name,
                                  price: widget.amount,
                                )));
                  },
                  icon: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          'MAKE ORDER',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.add_chart,
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
    );
  }
}
