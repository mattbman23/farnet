import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:random_color/random_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farnet',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xfffbfbfb),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Farnet",
          style: GoogleFonts.varelaRound(
            color: Colors.black,
            fontSize: 32,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.15,
            padding: EdgeInsets.only(bottom: 14),
            child: NameCard(),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 23),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 14,
                itemBuilder: (context, index) {
                  return Container(
                    height: size.height * 0.15,
                    child: AppCard(),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NameCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0xff8a96ff),
            offset: Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Color(0xff8a96ff),
            Color(0xff71d8d4),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Matthew Budiman",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppCard extends StatefulWidget {
  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  Color randomLightColor = RandomColor().randomColor(
    colorBrightness: ColorBrightness.light,
    colorSaturation: ColorSaturation.lowSaturation,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: randomLightColor,
              borderRadius: BorderRadius.circular(7),
            ),
            height: 70,
            width: 70,
            child: Icon(
              LineIcons.bolt,
              color: Colors.white,
              size: 45,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "Learner",
                          style: GoogleFonts.concertOne(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: randomLightColor,
                            borderRadius: BorderRadiusDirectional.circular(100),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}