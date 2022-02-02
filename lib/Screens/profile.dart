// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Hello John John',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                width: 100,
              ),
              CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Image.asset('assets/john.jfif'))
            ]),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text('Name:',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text('Age:',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text('Location:',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text('Phone number:',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text('Email:',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                  )),
            ),
            SizedBox(
              height: 180,
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
                    // Navigator.pushReplacement(
                    //     context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  icon: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text(
                          'LOGOUT',
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
          ],
        ),
      ),
    );
  }
}
