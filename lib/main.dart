import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbooking/feature/profile/screen/kezia_profile.dart';

var w;
var h;
var userName;
var userEmail;
var userNumber;
var userPassword;
var currentUserStatus;
var currentImg =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdWVqmFdjrtxxootI6eFCSzv_OzEb0gS7VtQ&usqp=CAU";
var currentUserId;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: myApp()));
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.urbanistTextTheme()),
        debugShowCheckedModeBanner: false,
        home: keziaProfile(),
      ),
    );
  }
}
