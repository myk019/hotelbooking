import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/feature/payment/screen/payment_page2.dart';
import 'package:hotelbooking/payment_status/screen/ticket_page.dart';
import 'package:hotelbooking/image_page.dart';
import 'package:lottie/lottie.dart';

import '../../../main.dart';

class myPayment extends StatefulWidget {
  const myPayment({super.key});

  @override
  State<myPayment> createState() => _myPaymentState();
}

class _myPaymentState extends State<myPayment> {
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
        title: Text("Payment",
          style: TextStyle(
              color: colorPage.blackcolor,
              fontWeight: FontWeight.w700,
              fontSize: w*0.07
          ),),
      ),
      backgroundColor: colorPage.sixthcolor,
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(w*0.03),
          height: w*1.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
            width: w*1,
            height: w*0.35,
            decoration: BoxDecoration(
                color: colorPage.secondaryColor,
                borderRadius: BorderRadius.circular(w*0.04)
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(w*0.03),
                  height: w*0.26,
                  width: w*0.25,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imagePage.image1),fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(w*0.05)
                  ),
                ),
                Container(
                  width: w*0.48,
                  // margin: EdgeInsets.only(left: w*0.0001),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Intercontinental Hotel",
                        style: TextStyle(
                            fontSize: w*0.055,
                            fontWeight: FontWeight.w700
                        ),),
                      SizedBox(height: w*0.03,),
                      Text("Lagos, Nigeria",
                        style: TextStyle(
                            fontSize: w*0.05,
                            fontWeight: FontWeight.w400
                        ),),
                      SizedBox(height: w*0.03,),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.,
                        children: [
                          SvgPicture.asset(imagePage.starIcon,color: colorPage.yellowcolor,
                            height: w*0.04,width: w*0.04,),
                          Text("5.0",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: w*0.035
                            ),),
                          Text("   (4,345 reviews)"),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: w*0.06),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\$205",
                        style: TextStyle(
                            color: colorPage.primaryColor,
                            fontSize: w*0.05,
                            fontWeight: FontWeight.w700
                        ),),
                      SizedBox(height: w*0.01,),
                      Text("/night",style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: w*0.035,
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
              Container(
                height: w*0.4,
                width: w*1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.03),
                  color: colorPage.secondaryColor
                ),
                child: Padding(
                  padding: EdgeInsets.all(w*0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Check in",style: TextStyle(
                            fontSize: w*0.055,
                            fontWeight: FontWeight.w500,
                            color: colorPage.blackcolor2
                          ),),
                          Text("December 16, 2024",style: TextStyle(
                            fontSize: w*0.055,
                            fontWeight: FontWeight.w700,
                            color: colorPage.blackcolor
                          ),),
                        ],
                      ),
                      SizedBox(height: w*0.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Check out",style: TextStyle(
                              fontSize: w*0.055,
                              fontWeight: FontWeight.w500,
                              color: colorPage.blackcolor2
                          ),),
                          Text("December 16, 2024",style: TextStyle(
                              fontSize: w*0.055,
                              fontWeight: FontWeight.w700,
                              color: colorPage.blackcolor
                          ),),
                        ],
                      ),
                      SizedBox(height: w*0.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Guest",style: TextStyle(
                              fontSize: w*0.055,
                              fontWeight: FontWeight.w500,
                              color: colorPage.blackcolor2
                          ),),
                          Text("3",style: TextStyle(
                              fontSize: w*0.055,
                              fontWeight: FontWeight.w700,
                              color: colorPage.blackcolor
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),

              ),
              Container(
                height: w*0.4,
                width: w*1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.03),
                  color: colorPage.secondaryColor
                ),
                child: Padding(
                  padding: EdgeInsets.all(w*0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("5 Nights",style: TextStyle(
                            fontSize: w*0.055,
                            fontWeight: FontWeight.w500,
                            color: colorPage.blackcolor2
                          ),),
                          Text("\$760.00",style: TextStyle(
                            fontSize: w*0.055,
                            fontWeight: FontWeight.w700,
                            color: colorPage.blackcolor
                          ),),
                        ],
                      ),
                      SizedBox(height: w*0.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Taxes & Fees (10%)",style: TextStyle(
                              fontSize: w*0.055,
                              fontWeight: FontWeight.w500,
                              color: colorPage.blackcolor2
                          ),),
                          Text("\$760.00",style: TextStyle(
                              fontSize: w*0.055,
                              fontWeight: FontWeight.w700,
                              color: colorPage.blackcolor
                          ),),
                        ],
                      ),
                      SizedBox(height: w*0.03,),
                      Divider(
                        indent: w*0.02,
                        endIndent: w*0.02,
                        height: w*0.04,
                        thickness: w*0.002,
                        color: colorPage.blackcolor.withOpacity(0.25),
                      ),
                      SizedBox(height: w*0.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",style: TextStyle(
                              fontSize: w*0.055,
                              fontWeight: FontWeight.w500,
                              color: colorPage.blackcolor2
                          ),),
                          Text("\$760.00",style: TextStyle(
                              fontSize: w*0.055,
                              fontWeight: FontWeight.w700,
                              color: colorPage.blackcolor
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: w*0.17,
                width: w*1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.02),
                    color: colorPage.secondaryColor
                ),
                child: Padding(
                  padding: EdgeInsets.all(w*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(imagePage.cardIcon,height: w*0.1,width: w*0.1,),
                          SizedBox(width: w*0.02,),
                          Text("**** **** **** ****4679",style: TextStyle(
                              fontSize: w*0.045,
                              fontWeight: FontWeight.w600
                          ),),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text("Change",style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: w*0.05,
                          color: colorPage.primaryColor
                        ),),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: colorPage.sixthcolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(w*0.05)
                  ),
                  content: Container(
                    height: w*1.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Lottie.asset(imagePage.tickAnimation),
                        Text("Payment Successfull!",style: TextStyle(
                          fontSize: w*0.06,
                          fontWeight: FontWeight.w700,
                          color: colorPage.primaryColor
                        ),),
                        Text("Successfully made payment and hotel booking",textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: w*0.055,
                          color: colorPage.blackcolor2
                        ),),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ticketPage(),));
                            },
                            child: Container(
                              child: Center(
                                child: Text("View Ticket",
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
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Center(
                                child: Text("Cancel",
                                  style: TextStyle(
                                      fontSize: w*0.052,
                                      fontWeight: FontWeight.w600,
                                      color: colorPage.primaryColor
                                  ),),
                              ),
                              height: w*0.15,
                              width: w*0.85,
                              decoration: BoxDecoration(
                                  color: colorPage.sixthcolor,
                                  borderRadius: BorderRadius.circular(w*0.1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },);
        },
        child: Container(
          height: w*0.35,
          width: w*1,
          color: colorPage.secondaryColor,
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
