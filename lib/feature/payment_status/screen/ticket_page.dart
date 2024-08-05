import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/image_page.dart';

import '../../main.dart';

class ticketPage extends StatefulWidget {
  const ticketPage({super.key});

  @override
  State<ticketPage> createState() => _ticketPageState();
}

class _ticketPageState extends State<ticketPage> {
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
        title: Text("Ticket",
          style: TextStyle(
              color: colorPage.blackcolor,
              fontWeight: FontWeight.w700,
              fontSize: w*0.07
          ),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: h*1,
          child: Column(
            children: [
              Stack(
                  children:[
                    SvgPicture.asset(imagePage.ticketBorder),
                    // SizedBox(height: w*0.04,),
                    Container(
                      padding: EdgeInsets.all(w*0.04),
                      child: Column(
                        children: [
                          SizedBox(height: w*0.045,),
                          Text("Intercontinental Hotel",
                            style: TextStyle(
                                fontSize:w*0.06,
                                fontWeight: FontWeight.w600
                            ),),
                          Container(
                            height: h*0.3,
                            width: w*1,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(imagePage.QRcode))
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: w*0.9,
                      left: w*0.1,
                      child: Container(
                        width: w*0.8,
                        height: w*0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: w*0.045,color: colorPage.blackcolor2),),
                                SizedBox(height: w*0.01,),
                                Text("Kezia Williams",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.045),),
                                SizedBox(height: w*0.05,),
                                Text("Check in",style: TextStyle(fontWeight: FontWeight.w500,fontSize: w*0.045,color: colorPage.blackcolor2),),
                                SizedBox(height: w*0.01,),
                                Text("Dec 16, 2024",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.045),),
                                SizedBox(height: w*0.05,),
                                Text("Hotel",style: TextStyle(fontWeight: FontWeight.w500,fontSize: w*0.045,color: colorPage.blackcolor2),),
                                SizedBox(height: w*0.01,),
                                Text("Intercontinental Hotel",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.045),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Phone Number",style: TextStyle(fontWeight: FontWeight.w500,fontSize: w*0.045,color: colorPage.blackcolor2),),
                                SizedBox(height: w*0.01,),
                                Text("+234 702 2347 642",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.045),),
                                SizedBox(height: w*0.05,),
                                Text("Check out",style: TextStyle(fontWeight: FontWeight.w500,fontSize: w*0.045,color: colorPage.blackcolor2),),
                                SizedBox(height: w*0.01,),
                                Text("Dec 16, 2024",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.045),),
                                SizedBox(height: w*0.05,),
                                Text("Guest",style: TextStyle(fontWeight: FontWeight.w500,fontSize: w*0.045,color: colorPage.blackcolor2),),
                                SizedBox(height: w*0.01,),
                                Text("3",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.045),)
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
      height: w*0.35,
      width: w*1,
      color: colorPage.secondaryColor,
      child: Center(
        child: Container(
          child: Center(
            child: Text("Download Ticket",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
