// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Like extends StatefulWidget {
  const Like({Key? key}) : super(key: key);

  @override
  _LikeState createState() => _LikeState();
}

class _LikeState extends State<Like> {
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
              height: 40,
            ),
            Text(
              'Clear All',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w900,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        LimitedBox(
                            maxHeight: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: InkWell(
                                    onTap: () {},
                                    child: Image.asset('assets/caprese.jpg')))),
                        Text(
                          'Caprese Chicken',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        LimitedBox(
                          maxHeight: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/Keto Bacon Chicken Thighs With Garlic Cream Sauce.jpg',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Keto Bacon Chicken Thighs With Garlic Cream Sauce',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        LimitedBox(
                          maxHeight: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: InkWell(
                              onTap: () {},
                              child: Image.asset(
                                  'assets/KOREAN STYLE FISH DONBURI BOWL.webp'),
                            ),
                          ),
                        ),
                        Text(
                          'KOREAN STYLE FISH DONBURI BOWL',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        LimitedBox(
                            maxHeight: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: InkWell(
                                    onTap: () {},
                                    child:
                                        Image.asset('assets/Porchetta.jpg')))),
                        Text(
                          'Porchetta',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        LimitedBox(
                            maxHeight: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: InkWell(
                                onTap: () {},
                                child: Image.asset(
                                    'assets/Bistecca alla Fiorentina.jpg'),
                              ),
                            )),
                        Text(
                          'Bistecca alla Fiorentina',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
