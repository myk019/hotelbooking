import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbooking/feature/auth/screen/forgot_page2.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/image_page.dart';

import '../../../main.dart';

class forgotPage extends StatefulWidget {
  const forgotPage({super.key});

  @override
  State<forgotPage> createState() => _forgotPageState();
}

class _forgotPageState extends State<forgotPage> {
  int selectedIndex=0;
  List a=[
    {
      "icon":imagePage.smsIcon,
      "text1":"via SMS:",
      "text2":"+234111******99"
    },
    {
      "icon":imagePage.emailIcon,
      "text1":"via Email:",
      "text2":" kez***9@your domain.com"
    }
  ];
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
            height: h*0.9,
            width: w*1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: w*0.8,
                  width: w*1,
                 decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage(imagePage.padlock))
                 ),
                ),
                Text("Select which contact details should we use to reset your password",
                  style:TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: w*0.045
                  ) ,),
                ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:2 ,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        selectedIndex=index;
                        setState(() {

                        });
                      },
                      child: Container(
                        height:w*0.30,
                        width: w*0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w*0.03),
                            border: Border.all(
                                color: colorPage.primaryColor,
                                width:selectedIndex==index? w*0.01:w*0.003
                            )
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(w*0.04),
                              height: w*0.23,
                              width: w*0.23,
                              decoration: BoxDecoration(
                                  color: colorPage.sixthcolor,
                                  shape: BoxShape.circle
                                // borderRadius: BorderRadius.circular(width*0.03)
                              ),
                              child: Center(child: SvgPicture.asset(a[index]["icon"],height: w*0.1,width: w*0.1,)),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(a[index]["text1"]),
                                Text(a[index]["text2"]),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: w*0.03,);
                  },
                ),
                SizedBox(height: w*0.05,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => forgotPage2(),));
                  },
                  child: Center(
                    child: Container(
                      child: Center(
                        child: Text("Continue",
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
            ),
          ),
        ),
      ),
    );
  }
}
