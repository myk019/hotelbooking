import 'package:flutter/material.dart';
import 'package:hotelbooking/feature/auth/screen/lets_you_in.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/image_page.dart';
import 'package:widget_loading/widget_loading.dart';

import '../main.dart';

class loadingPage extends StatefulWidget {
  const loadingPage({super.key});

  @override
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 1)
    ).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => letsYouIn(),)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              height: w*0.8,
              width: w*0.6,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagePage.loadingPageLogo))
              ),
            ),
          ),
          CircularWidgetLoading(
              child:Text("fff"),
          padding: EdgeInsets.all(w*0.12),
          dotRadius: w*0.015,
            dotColor: colorPage.primaryColor,
          )
        ],
      ),
    );
  }
}

