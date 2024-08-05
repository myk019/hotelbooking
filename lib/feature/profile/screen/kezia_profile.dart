import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotelbooking/feature/auth/screen/lets_you_in.dart';
import 'package:hotelbooking/feature/auth/screen/login_to.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/feature/profile/screen/edit_profile.dart';
import 'package:hotelbooking/settings/screen/notification.dart';
import 'package:hotelbooking/settings/screen/security.dart';
import 'package:hotelbooking/image_page.dart';
import 'package:image_picker/image_picker.dart';

import '../../../main.dart';

class keziaProfile extends StatefulWidget {
  const keziaProfile({super.key});

  @override
  State<keziaProfile> createState() => _keziaProfileState();
}

class _keziaProfileState extends State<keziaProfile> {
  File?file;
  pickFile(ImageSource) async {
    final imageFile=await ImagePicker.platform.pickImage(source: ImageSource);
    file=File(imageFile!.path);
    if(mounted){
      setState(() {
        file=File(imageFile.path);
      });
      print(imageFile);

    }
  }
  bool toggle=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.secondaryColor,
        leading: Padding(
          padding: EdgeInsets.only(left: w*0.02,top: w*0.02),
          child: Container(
              height: w*0.01,
              width: w*0.01,
              child: SvgPicture.asset(imagePage.boluIcon,
                height: w*0.01,
                width: w*0.01,)),
        ),
        title: Text("Profile",
          style: TextStyle(
              fontSize: w*0.08,
              fontWeight: FontWeight.w700,
              color: colorPage.blackcolor
          ),),
        actions: [
          SvgPicture.asset(imagePage.moreCircle,height: w*0.08,width: w*0.08,),
          SizedBox(width: w*0.05,)
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(w*0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: w*0.5,
                width: w*1,
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children:[
                          CircleAvatar(
                            radius: w*0.15,
                            backgroundImage: FileImage(file!),
                          ),
                          Positioned(
                              bottom:0,
                              right:0,
                              child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(w*0.06),
                                            ),
                                            content: Container(
                                              height: w*0.45,
                                              width: w*1.5,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("Choose a picture",style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: w*0.06
                                                  ),),
                                                  SizedBox(height: w*0.03,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          pickFile(ImageSource.camera);
                                                        },
                                                        child: Container(
                                                          height: w*0.2,
                                                          width: w*0.2,
                                                          // color: Colors.black,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(w*0.05),
                                                            color: Colors.blue,
                                                          ),
                                                          child: Icon(Icons.camera_alt_outlined,size: w*0.12),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          pickFile(ImageSource.gallery);
                                                        },
                                                        child: Container(
                                                          height: w*0.2,
                                                          width: w*0.2,
                                                          // color: Colors.black,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(w*0.05),
                                                            color: Colors.blue,
                                                          ),
                                                          child: Icon(Icons.image,size: w*0.12),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },);
                                  },
                                  child: SvgPicture.asset(imagePage.penIcon))),
                        ]
                      ),
                    ),
             Text(userName??"",style: TextStyle(
                     fontSize: w*0.075,
                     fontWeight: FontWeight.w700
             ),),
             Text(userEmail??"",style: TextStyle(
                     fontSize: w*0.045,
                     fontWeight: FontWeight.w600,
                     color: colorPage.blackcolor2
             ),),
                  ],
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => editProfile(googleSign: false),));
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(imagePage.person),
                      title: Text("Edit Profile",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w*0.055
                      ),),),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(imagePage.wallet),
                    title: Text("Payment",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: w*0.055
                    ),),),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => notification(),));
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(imagePage.ringNotificationIcon),
                      title: Text("Notifications",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w*0.055
                      ),),),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => security(),));
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(imagePage.security),
                      title: Text("Security",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w*0.055
                      ),),),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(imagePage.helpIcon),
                    title: Text("Help",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: w*0.055
                    ),),),
                  ListTile(
                    leading: SvgPicture.asset(imagePage.outLineEye),
                    title: Text("Dark Theme",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: w*0.055,
                    ),),
                  trailing:Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            toggle=!toggle;
                            setState(() {
                            });
                          },
                          child: Container(
                            height: w*0.07,
                            width: w*0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.05),
                              color:toggle? colorPage.primaryColor:colorPage.greycolor,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(
                            milliseconds: 200,
                          ),
                          left: toggle?w*0.05:w*0.0,
                          right: toggle?w*0.0:w*0.05,
                          top: w*0.005,
                          child: InkWell(
                            onTap: () {
                              toggle=!toggle;
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
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        backgroundColor: colorPage.secondaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(w*0.1),
                                topLeft: Radius.circular(w*0.1)
                            )
                        ),
                          context: context,
                          builder: (context) {
                            return   Container(
                              margin: EdgeInsets.all(w*0.03),
                              height: w*0.66,
                              width: w*1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Cancel Booking",style: TextStyle(
                                      fontSize: w*0.07,
                                      fontWeight: FontWeight.w700,
                                      color: colorPage.redcolor2
                                  ),),
                                  Divider(
                                    indent: w*0.02,
                                    endIndent: w*0.02,
                                    height: w*0.04,
                                    thickness: w*0.002,
                                    color: colorPage.blackcolor.withOpacity(0.25),
                                  ),
                                  Text("Are you sure you want to cancel your hotel bookings?",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: w*0.065,
                                        color: colorPage.blackcolor2
                                    ),),
                                 Column(
                                   children: [
                                     Center(
                                       child: InkWell(
                                         onTap: () {
                                           GoogleSignIn().signOut();
                                           FirebaseAuth.instance.signOut();
                                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => letsYouIn(),), (route) => false);
                                         },
                                         child: Container(
                                           child: Center(
                                             child: Text("Yes, Continue",
                                               style: TextStyle(
                                                   fontSize: w*0.04,
                                                   fontWeight: FontWeight.w600,
                                                   color: colorPage.secondaryColor
                                               ),),
                                           ),
                                           height: w*0.13,
                                           width: w*0.7,
                                           decoration: BoxDecoration(
                                               color: colorPage.primaryColor,
                                               borderRadius: BorderRadius.circular(w*0.1),
                                           ),
                                         ),
                                       ),
                                     ),
                                     SizedBox(height: w*0.02,),
                                     Center(
                                       child: InkWell(
                                         onTap: () {
                                           Navigator.pop(context);
                                         },
                                         child: Container(
                                           child: Center(
                                             child: Text("Cancel",
                                               style: TextStyle(
                                                   fontSize: w*0.04,
                                                   fontWeight: FontWeight.w600,
                                                   color: colorPage.primaryColor
                                               ),),
                                           ),
                                           height: w*0.13,
                                           width: w*0.7,
                                           decoration: BoxDecoration(
                                               color: colorPage.sixthcolor,
                                               borderRadius: BorderRadius.circular(w*0.1),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ],
                                 )
                                ],
                              ),
                            );
                          },);
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(imagePage.logOut,color: colorPage.redcolor,),
                      title: Text("Logout",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w*0.055,
                        color: colorPage.redcolor
                      ),),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
