import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbooking/feature/auth/screen/password_page.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/image_page.dart';

import '../../main.dart';

class security extends StatefulWidget {
  const security({super.key});

  @override
  State<security> createState() => _securityState();
}

class _securityState extends State<security> {
  bool toggle1=false;
  bool toggle2=false;
  bool toggle3=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:colorPage.secondaryColor,
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
        title: Text("Security",
          style: TextStyle(
              color: colorPage.blackcolor,
              fontWeight: FontWeight.w700,
              fontSize: w*0.07
          ),),
      ),
      body: Column(
        children: [
          Container(
            height: w*0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  title: Text("Face ID",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.w500),),
                  trailing:Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            toggle1=!toggle1;
                            setState(() {
                            });
                          },
                          child: Container(
                            height: w*0.07,
                            width: w*0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.05),
                              color:toggle1? colorPage.primaryColor:colorPage.greycolor,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(
                            milliseconds: 200,
                          ),
                          left: toggle1?w*0.05:w*0.0,
                          right: toggle1?w*0.0:w*0.05,
                          top: w*0.005,
                          child: InkWell(
                            onTap: () {
                              toggle1=!toggle1;
                              setState(() {
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(
                                milliseconds: 200,
                              ),
                              curve: Curves.easeIn,
                              height: w*0.06,
                              width: w*0.06,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorPage.secondaryColor
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                ListTile(
                  title: Text("Remember me",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.w500),),
                  trailing:Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            toggle2=!toggle2;
                            setState(() {
                            });
                          },
                          child: Container(
                            height: w*0.07,
                            width: w*0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.05),
                              color:toggle2? colorPage.primaryColor:colorPage.greycolor,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(
                            milliseconds: 200,
                          ),
                          left: toggle2?w*0.05:w*0.0,
                          right: toggle2?w*0.0:w*0.05,
                          top: w*0.005,
                          child: InkWell(
                            onTap: () {
                              toggle2=!toggle2;
                              setState(() {
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(
                                milliseconds: 200,
                              ),
                              curve: Curves.easeIn,
                              height: w*0.06,
                              width: w*0.06,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorPage.secondaryColor
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                ListTile(
                  title: Text("Touch ID",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.w500),),
                  trailing:Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            toggle3=!toggle3;
                            setState(() {
                            });
                          },
                          child: Container(
                            height: w*0.07,
                            width: w*0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.05),
                              color:toggle3? colorPage.primaryColor:colorPage.greycolor,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(
                            milliseconds: 200,
                          ),
                          left: toggle3?w*0.05:w*0.0,
                          right: toggle3?w*0.0:w*0.05,
                          top: w*0.005,
                          child: InkWell(
                            onTap: () {
                              toggle3=!toggle3;
                              setState(() {
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(
                                milliseconds: 200,
                              ),
                              curve: Curves.easeIn,
                              height: w*0.06,
                              width: w*0.06,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorPage.secondaryColor
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                ListTile(
                  title: Text("Google Authenticator",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.w500),),
                  trailing: SvgPicture.asset(imagePage.arrowrightIcon2),
                ),
              ],
            ),
          ),
          SizedBox(height: w*0.02,),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => passwordPage(),));
              },
              child: Container(
                child: Center(child: Text("Change Password",
                  style: TextStyle(
                      fontSize: w*0.052,
                      fontWeight: FontWeight.w600,
                      color: colorPage.primaryColor
                  ),)),
                height: w*0.15,
                width: w*0.85,
                decoration: BoxDecoration(
                    color: colorPage.sixthcolor,
                    borderRadius:BorderRadius.circular(w*0.1),
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
