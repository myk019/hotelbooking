import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotelbooking/feature/auth/screen/create_account.dart';
import 'package:hotelbooking/feature/auth/screen/forgot_page.dart';
import 'package:hotelbooking/feature/auth/screen/profile_page.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/googleSign.dart';
import 'package:hotelbooking/home/screen/bottom_navigation.dart';
import 'package:hotelbooking/home/screen/home_page.dart';
import 'package:hotelbooking/image_page.dart';

import '../../../main.dart';
import 'lets_you_in.dart';

class loginToYourAccount extends StatefulWidget {
  const loginToYourAccount({super.key});

  @override
  State<loginToYourAccount> createState() => _loginToYourAccountState();
}

class _loginToYourAccountState extends State<loginToYourAccount> {


  dataCheck() async {

    QuerySnapshot data = await FirebaseFirestore.instance.collection("bolu").where("email",isEqualTo: emailController.text).get();
    if(data.docs.isEmpty){

      Navigator.push(context, CupertinoPageRoute(builder: (context) => profilePage(googleSignIn: false),));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please create account")));

    }else{
      userEmail= data.docs[0]["email"];
      userName=data.docs[0]["name"];
      currentImg=data.docs[0]["image"];
      userNumber=data.docs[0]["phone"];
      userPassword=data.docs[0]["password"];
      currentUserId=data.docs[0].id??"";


      if(currentUserStatus=data.docs[0]["block"]==true){

        showDialog(context: context, builder: (context) =>
            AlertDialog(

              title: Text("This email has been blocked",style: TextStyle(fontSize: w*0.05,fontWeight: FontWeight.w600),),

              actions: [

                TextButton(onPressed: () {

                  Navigator.pop(context);
                }, child: Text("Ok",style: TextStyle(fontSize: w*0.05,fontWeight: FontWeight.w600),))
              ],
            ),);
        return;
      }

      Navigator.push(context, CupertinoPageRoute(builder: (context) => bottomNavigation(),));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted SUCCESSFULLY")));
    }
  }

  final formKey=GlobalKey<FormState>();
  final emailValidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordValidatoin=RegExp("");

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool visibility=false;
  bool tick=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(w*0.025),
          child: Form(
            key:formKey,
            child: Container(
              height: h*0.9,
              width: w*1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: w*0.01,),
                  Padding(
                    padding: EdgeInsets.only(left: w*0.05),
                    child: Text("Login to your Account",
                      style: TextStyle(
                          fontSize: w*0.14,
                          fontWeight: FontWeight.w700
                      ),),
                  ),
                  SizedBox(height: w*0.01,),
                  Padding(
                    padding:  EdgeInsets.only(left: w*0.03,right: w*0.03),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                            fontSize: w*0.05,
                            fontWeight: FontWeight.w500,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if(
                            !emailValidation.hasMatch (value!)
                            ){
                              return ("Enter a Valid Email");
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            filled: true,
                            fillColor: colorPage.lightgreycolor,
                            prefixIcon: Container(
                              height: w*0.03,
                              width: w*0.03,
                              margin: EdgeInsets.all(w*0.028),
                              child:
                              SvgPicture.asset(imagePage.messageIcon,),),
                            // suffixText: "text",
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontSize: w*0.06,
                              fontWeight: FontWeight.w500,
                              color: colorPage.greycolor
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:colorPage.greycolor,
                                ),
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorPage.blackcolor,
                                ),
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                          ),
                        ),
                        SizedBox(height: w*0.05,),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          maxLength: 8,
                          obscureText: visibility?false:true,
                          style: TextStyle(
                            fontSize: w*0.05,
                            fontWeight: FontWeight.w500,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if(
                            !passwordValidatoin.hasMatch(value!)
                            ){
                              return ("Enter Valid Password");
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            filled: true,
                            fillColor: colorPage.lightgreycolor,
                            prefixIcon: InkWell(
                              onTap: () {
                                visibility=!visibility;
                                setState(() {
                                });
                              },
                              child: Icon(visibility?Icons.visibility:Icons.visibility_off,
                              color: colorPage.blackcolor,),),
                            hintText: "enter 8 digit password",
                            hintStyle: TextStyle(
                                color: colorPage.greycolor,
                                fontWeight: FontWeight.w500,
                                fontSize: w*0.05
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:colorPage.greycolor,
                                ),
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorPage.blackcolor,
                                ),
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                          ),
                        ),
                        SizedBox(height: w*0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              side:BorderSide(color: colorPage.primaryColor),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(w*0.01)),
                              value: tick,
                              activeColor: colorPage.primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  tick=!tick;
                                });
                              },),
                            Text("Remember me",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: w*0.045
                              ),)
                          ],
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      if(
                      emailController.text!=""&&
                          passwordController.text!=""&&
                          formKey.currentState!.validate()
                      ){
                        dataCheck();
                      }else{
                        emailController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter Email"))):
                        passwordController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter Password"))):
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your valid details")));
                      }

                    },
                    child: Center(
                      child: Container(
                        child: Center(
                          child: Text("Sign in",
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
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => forgotPage(),));
                    },
                    child: Center(
                      child: Text("Forgot the password?",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: w*0.04,
                            color: colorPage.primaryColor),),
                    ),
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
                      Text("or continue with",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: w*0.04
                        ),),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: w*0.15,
                        width: w*0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w*0.025),
                            border: Border.all(color: colorPage.greycolor)
                        ),
                        child: Container(
                            margin: EdgeInsets.all(w*0.015),
                            child: SvgPicture.asset(imagePage.facebookIcons)),
                      ),
                      InkWell(
                        onTap: () {
                          signInWithGoogle(context);
                        },
                        child: Container(
                          height: w*0.15,
                          width: w*0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.025),
                              border: Border.all(color: colorPage.greycolor)
                          ),
                          child: Container(
                              margin: EdgeInsets.all(w*0.026),
                              child: SvgPicture.asset(imagePage.googleIcon)),
                        ),
                      ),
                      Container(
                        height: w*0.15,
                        width: w*0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w*0.025),
                            border: Border.all(color: colorPage.greycolor)
                        ),
                        child: Container(
                            margin: EdgeInsets.all(w*0.025),
                            child: SvgPicture.asset(imagePage.appleIcon)),
                      ),
                    ],
                  ),
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
