import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbooking/core/colour_page.dart';

import '../../../core/image_page.dart';
import '../../../main.dart';
import 'new_card.dart';

class paymentPage extends StatefulWidget {
  const paymentPage({super.key});

  @override
  State<paymentPage> createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
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
        title: Text("Payment",
          style: TextStyle(
              color: colorPage.blackcolor,
              fontWeight: FontWeight.w700,
              fontSize: w*0.07
          ),),
      ),
      body: SingleChildScrollView(
        physics:  BouncingScrollPhysics(),
        child: Container(
          height: h*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(w*0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Payment Methods",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: w*0.055
                        ),),
                        InkWell(
                          onTap: () {
                          },
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => newCard(),));
                            },
                            child: Text("Add New Card",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: w*0.055,
                              color: colorPage.primaryColor
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: w*0.04,),
                  Container(
                    height: w*0.7,
                    width: w*1,
                    color: colorPage.sixthcolor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: w*0.15,
                          width: w*0.9,
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
                          height: w*0.15,
                          width: w*0.9,
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
                          height: w*0.15,
                          width: w*0.9,
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
                      ],
                    ),
                    ),
                ],
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please add new card")));
                  },
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
    );
  }
}
