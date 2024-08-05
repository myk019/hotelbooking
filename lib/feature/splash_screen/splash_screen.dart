import 'package:flutter/material.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/image_page.dart';

import '../main.dart';
import 'onbody_screen1.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 4)
    ).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => onbodyScreen1(),)));
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: w*1,
        height: h*1,
        padding: EdgeInsets.only(left:w*0.09,bottom: w*0.17),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imagePage.homepage),fit: BoxFit.fill)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome to",
            style: TextStyle(
              color: colorPage.secondaryColor,
              fontSize: w*0.12,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(height: w*0.04,),
            Text("Bolu",
            style: TextStyle(
              color: colorPage.primaryColor,
              fontSize: w*0.3,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(height: w*0.04,),
            Text("The best hotel bookings in the century to accompany your vacation",
            style: TextStyle(
              color: colorPage.secondaryColor,
              fontSize: w*0.05,
              fontWeight: FontWeight.w600
            ),),
            // SizedBox(height: width*0.07,),
          ],
        ),
      ),
    );
  }
}
