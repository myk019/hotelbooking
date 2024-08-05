import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotelbooking/feature/auth/screen/profile_page.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/googleSign.dart';
import 'package:hotelbooking/image_page.dart';

import '../../../home/screen/bottom_navigation.dart';
import '../../../main.dart';
import 'lets_you_in.dart';

class createAccount extends StatefulWidget {
  const createAccount({super.key});

  @override
  State<createAccount> createState() => _createAccountState();
}
class _createAccountState extends State<createAccount> {


  final formKey=GlobalKey<FormState>();
  final emailValidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordValidatoin=RegExp("");

  TextEditingController emailController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController placeController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  bool visibility=false;
  bool tick=true;
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
        child: Form(
          key: formKey,
          child: Container(
            height: h*0.9,
            width: w*1,
            child: Padding(
              padding:  EdgeInsets.all(w*0.025),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: w*0.05),
                    child: Text("Create your Account",
                    style: TextStyle(
                      fontSize: w*0.14,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: w*0.03,right: w*0.03),
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
                            SvgPicture.asset(imagePage.messageIcon),),
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
                            Text("Pay on arrival",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: w*0.045
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: w*0.05,),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if(
                        nameController.text!=""&&
                        placeController.text!=""&&
                        phoneController.text!=""&&
                        formKey.currentState!.validate()
                        ){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => profilePage(googleSignIn:false),));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted SUCCESSFULLY")));
                        }else{
                          nameController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your name"))):
                          placeController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your place"))):
                          phoneController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter valid number"))):
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your valid details")));
                        }

                      },
                      child: Container(
                        child: Center(
                          child: Text("Sign up",
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
                  // SizedBox(height: w*0.12,),
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
                  // SizedBox(height: w*0.08,),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
