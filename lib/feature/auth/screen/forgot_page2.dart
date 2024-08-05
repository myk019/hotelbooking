import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbooking/feature/auth/screen/password_page.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/image_page.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../main.dart';

class forgotPage2 extends StatefulWidget {
  const forgotPage2({super.key});

  @override
  State<forgotPage2> createState() => _forgotPage2State();
}

class _forgotPage2State extends State<forgotPage2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.secondaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              height:w*0.02,
              width: w*0.02,
              padding: EdgeInsets.all(w*0.03),
              child: SvgPicture.asset(imagePage.leftArrow,height: w*0.04,width: w*0.04,)),
        ),
        title: Text("Forgot password",
          style: TextStyle(
              color: colorPage.blackcolor,
              fontWeight: FontWeight.w700,
              fontSize: w*0.07
          ),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(w*0.04),
          child: Container(
            height: h*0.8,
            width: w*1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: w*0.7,
                      width: w*1,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(imagePage.protect))
                      ),
                    ),
                    SizedBox(height: w*0.02,),
                    Center(
                      child: Text("Code has been sent to +234111******99",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                           height: w*0.0075
                        ),),
                    ),
                    SizedBox(height: w*0.05,),
                    Center(
                      child: Pinput(
                        length: 4,
                        preFilledWidget: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: colorPage.primaryColor),
                            borderRadius: BorderRadius.circular(w*0.03),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: w*0.05,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Resend code"),
                        Countdown(
                            seconds: 60,
                            build: (p0, p1) {
                              return Text("$p1",
                                style:TextStyle(
                                  color: colorPage.primaryColor
                                ) ,);
                            },),
                        Text("s")
                      ],
                    ),
                  ],
                ),
                // SizedBox(height: w*0.35,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => passwordPage(),));
                      },
                      child: Center(
                        child: Container(
                          child: Center(
                            child: Text("Verify",
                              style: TextStyle(
                                  fontSize: w*0.052,
                                  fontWeight: FontWeight.w600,
                                  color: colorPage.secondaryColor
                              ),),
                          ),
                          height: w*0.15,
                          width: w*0.85,
                          decoration: BoxDecoration(
                              color: colorPage.primaryColor,
                              borderRadius: BorderRadius.circular(w*0.1),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    color: colorPage.blackcolor.withOpacity(0.15),
                                    offset: Offset(0, 4)
                                )
                              ]
                          ),
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

