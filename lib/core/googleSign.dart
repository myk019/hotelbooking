
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotelbooking/feature/auth/screen/create_account.dart';
import 'package:hotelbooking/feature/auth/screen/profile_page.dart';


import '../feature/auth/screen/lets_you_in.dart';
import '../feature/home/screen/bottom_navigation.dart';
import '../main.dart';
signInWithGoogle(context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser
      ?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential);

  user = userCredential.user;
  userName = user?.displayName;
  userEmail = user?.email;
  currentImg=user!.photoURL!;


  QuerySnapshot google = await FirebaseFirestore.instance.collection("bolu")
      .where("email", isEqualTo: userEmail)
      .get();
  if (google.docs.isEmpty) {
    Navigator.pushAndRemoveUntil(
        context, CupertinoPageRoute(builder: (context) => profilePage(googleSignIn: true),), (
        route) => false);
  } else {

    if(currentUserStatus=google.docs[0]["block"]==true){

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

    Navigator.pushAndRemoveUntil(context,
        CupertinoPageRoute(builder: (context) => bottomNavigation(),), (
            route) => false);

  }
}