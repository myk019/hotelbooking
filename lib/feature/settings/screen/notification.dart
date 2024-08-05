import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/image_page.dart';

import '../../main.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  bool a=false;
  bool b=false;
  bool c=false;
  bool d=false;
  bool e=false;
  bool f=false;
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
        title: Text("Notification",
          style: TextStyle(
              color: colorPage.blackcolor,
              fontWeight: FontWeight.w700,
              fontSize: w*0.07
          ),),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: w*0.02,top: w*0.03),
        child: Container(
          height: h*0.83,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ListTile(
                    title: Text("General Notification",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.w500),),
                    trailing:Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              a=!a;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: w*0.07,
                              width: w*0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.05),
                                color:a? colorPage.primaryColor:colorPage.greycolor,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            left: a?w*0.05:w*0.0,
                            right: a?w*0.0:w*0.05,
                            top: w*0.005,
                            child: InkWell(
                              onTap: () {
                                a=!a;
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
                    title: Text("Sound",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.w500),),
                    trailing:Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              b=!b;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: w*0.07,
                              width: w*0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.05),
                                color:b? colorPage.primaryColor:colorPage.greycolor,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            left: b?w*0.05:w*0.0,
                            right: b?w*0.0:w*0.05,
                            top: w*0.005,
                            child: InkWell(
                              onTap: () {
                                b=!b;
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
                    title: Text("Vibrate",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.w500),),
                    trailing:Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              c=!c;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: w*0.07,
                              width: w*0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.05),
                                color:c? colorPage.primaryColor:colorPage.greycolor,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            left: c?w*0.05:w*0.0,
                            right: c?w*0.0:w*0.05,
                            top: w*0.005,
                            child: InkWell(
                              onTap: () {
                                c=!c;
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
                    title: Text("App Updates",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.w500),),
                    trailing:Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              d=!d;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: w*0.07,
                              width: w*0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.05),
                                color:d? colorPage.primaryColor:colorPage.greycolor,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            left: d?w*0.05:w*0.0,
                            right: d?w*0.0:w*0.05,
                            top: w*0.005,
                            child: InkWell(
                              onTap: () {
                                d=!d;
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
                    title: Text("New Service Available",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.w500),),
                    trailing:Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              e=!e;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: w*0.07,
                              width: w*0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.05),
                                color:e? colorPage.primaryColor:colorPage.greycolor,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            left: e?w*0.05:w*0.0,
                            right: e?w*0.0:w*0.05,
                            top: w*0.005,
                            child: InkWell(
                              onTap: () {
                                e=!e;
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
                    title: Text("New tips available",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.w500),),
                    trailing:Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              f=!f;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: w*0.07,
                              width: w*0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.05),
                                color:f? colorPage.primaryColor:colorPage.greycolor,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            left: f?w*0.05:w*0.0,
                            right: f?w*0.0:w*0.05,
                            top: w*0.005,
                            child: InkWell(
                              onTap: () {
                                f=!f;
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
                ],
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Center(child: Text("Update",
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
            ],
          ),
        ),
      ),
    );
  }
}
