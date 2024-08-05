import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotelbooking/feature/auth/screen/create_account.dart';
import 'package:hotelbooking/feature/auth/screen/login_to.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/googleSign.dart';
import 'package:hotelbooking/home/screen/bottom_navigation.dart';
import 'package:hotelbooking/image_page.dart';

import '../../../home/screen/home_page.dart';
import '../../../main.dart';

class letsYouIn extends StatefulWidget {
  const letsYouIn({super.key});

  @override
  State<letsYouIn> createState() => _letsYouInState();
}
User?user;
class _letsYouInState extends State<letsYouIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: h*1,
            width: w*1,
            child: Padding(
              padding: EdgeInsets.all(w*0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: w*0.05,),
                  Center(
                    child: Text("Let’s you in",
                    style: TextStyle(
                      fontSize: w*0.14,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                  SizedBox(height: w*0.05,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child:
                        Container(
                          height: w*0.14,
                          width: w*0.83,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: w*0.11,
                                width: w*0.1,
                                child:
                                SvgPicture.asset(imagePage.facebookIcons),
                              ),
                              SizedBox(width:w*0.03),
                              Text("Continue with Facebook",style:
                              TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: w*0.05,
                                  color: colorPage.fourthcolor
                              ),)
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: colorPage.secondaryColor,
                            borderRadius: BorderRadius.circular(w*0.025),
                            border: Border.all(color: colorPage.greycolor),
                          ),
                        ),
                      ),
                      SizedBox(height: w*0.05,),
                      InkWell(
                        onTap: () {
                          signInWithGoogle(context);
                        },
                        child: Center(
                          child:
                          Container(
                            height: w*0.14,
                            width: w*0.83,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: w*0.09,
                                  width: w*0.1,
                                  child:
                                  SvgPicture.asset(imagePage.googleIcon),
                                ),
                                SizedBox(width:w*0.03),
                                Text("Continue with Google",style:
                                  TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: w*0.05,
                                    color: colorPage.fourthcolor
                                  ),)
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: colorPage.secondaryColor,
                              borderRadius: BorderRadius.circular(w*0.025),
                              border: Border.all(color: colorPage.greycolor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: w*0.05,),
                      Center(
                        child:
                        Container(
                          height: w*0.14,
                          width: w*0.83,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: w*0.1,
                                width: w*0.1,
                                child:
                                SvgPicture.asset(imagePage.appleIcon),
                              ),
                              SizedBox(width:w*0.02),
                              Text("Continue with Apple",style:
                              TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: w*0.05,
                                  color: colorPage.fourthcolor
                              ),)
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: colorPage.secondaryColor,
                            borderRadius: BorderRadius.circular(w*0.025),
                            border: Border.all(color: colorPage.greycolor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          indent: w*0.02,
                          endIndent: w*0.02,
                          height: w*0.04,
                          thickness: w*0.002,
                          color: colorPage.blackcolor.withOpacity(0.25),
                        ),
                      ),
                      Text("or"),
                      Expanded(
                        child: Divider(
                          indent: w*0.02,
                          endIndent: w*0.02,
                          height: w*0.04,
                          thickness: w*0.002,
                          color: colorPage.blackcolor.withOpacity(0.25),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => loginToYourAccount(),));
                      },
                      child: Container(
                        child: Center(child: Text("Sign in with password",
                        style: TextStyle(
                          fontSize: w*0.052,
                          fontWeight: FontWeight.w600,
                          color: colorPage.secondaryColor
                        ),)),
                        height: w*0.15,
                        width: w*0.85,
                        decoration: BoxDecoration(
                            color: colorPage.primaryColor,
                          borderRadius:BorderRadius.circular(w*0.1),
                          boxShadow:[
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 2,
                              color: colorPage.blackcolor.withOpacity(0.15),
                              offset: Offset(0, 4)
                            )
                          ]
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: w*0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: w*0.04,
                        color: colorPage.greycolor2
                      ),),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => createAccount(),));
                        },
                        child: Text("  Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: w*0.04,
                          color: colorPage.primaryColor),),
                      )
                    ],
                  )


                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
