import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/image_page.dart';

import '../main.dart';

class cancelHotelBooking extends StatefulWidget {
  const cancelHotelBooking({super.key});

  @override
  State<cancelHotelBooking> createState() => _cancelHotelBookingState();
}

class _cancelHotelBookingState extends State<cancelHotelBooking> {
  String payment="a";
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
        title: Text("Cancel Hotel Booking",
          style: TextStyle(
              color: colorPage.blackcolor,
              fontWeight: FontWeight.w700,
              fontSize: w*0.07
          ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:w*0.05),
           Padding(
             padding: EdgeInsets.only(left: w*0.03,right: w*0.03),
             child: Center(child: Text("Please select a payment refund method (only 80% will be refunded)",
             style: TextStyle(
               fontSize: w*0.042,
               fontWeight: FontWeight.w400
             ),)),
           ),
            SizedBox(height: w*0.04,),
            Container(
              height: h*0.5,
              padding: EdgeInsets.only(left: w*0.05,right: w*0.05),
              width: w*1,
              color: colorPage.sixthcolor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: w*0.17,
                    width: w*1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.02),
                        color: colorPage.secondaryColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(imagePage.payPalIcon,height: w*0.1,width: w*0.1,),
                            SizedBox(width: w*0.02,),
                            Text("Paypal",style: TextStyle(
                                fontSize: w*0.045,
                                fontWeight: FontWeight.w600
                            ),)
                          ],
                        ),
                        Radio(
                          activeColor: colorPage.primaryColor,
                          fillColor: MaterialStatePropertyAll(colorPage.primaryColor),
                          value: "a",
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment=value!;
                            });
                          },)
                      ],
                    ),
                  ),
                  Container(
                    height: w*0.17,
                    width: w*1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.02),
                        color: colorPage.secondaryColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(imagePage.googleIcon,height: w*0.09,width: w*0.09,),
                            SizedBox(width: w*0.02,),
                            Text("Google Pay",style: TextStyle(
                                fontSize: w*0.045,
                                fontWeight: FontWeight.w600
                            ),)
                          ],
                        ),
                        Radio(
                          activeColor: colorPage.primaryColor,
                          fillColor: MaterialStatePropertyAll(colorPage.primaryColor),
                          value: "b",
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment=value!;
                            });
                          },)
                      ],
                    ),
                  ),
                  Container(
                    height: w*0.17,
                    width: w*1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.02),
                        color: colorPage.secondaryColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(imagePage.appleIcon,height: w*0.1,width: w*0.1,),
                            SizedBox(width: w*0.02,),
                            Text("Apple Pay",style: TextStyle(
                                fontSize: w*0.045,
                                fontWeight: FontWeight.w600
                            ),)
                          ],
                        ),
                        Radio(
                          activeColor: colorPage.primaryColor,
                          fillColor: MaterialStatePropertyAll(colorPage.primaryColor),
                          value: "c",
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment=value!;
                            });
                          },)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("Pay with Debit/Credit Card",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: w*0.05
                        ),),
                    ],
                  ),
                  Container(
                    height: w*0.17,
                    width: w*1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.02),
                        color: colorPage.secondaryColor
                    ),
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
                            ),)
                          ],
                        ),
                        Radio(
                          activeColor: colorPage.primaryColor,
                          fillColor: MaterialStatePropertyAll(colorPage.primaryColor),
                          value: "d",
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment=value!;
                            });
                          },)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: w*0.38,),
            Center(
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

          ],
        ),
      ),
    );
  }
}
