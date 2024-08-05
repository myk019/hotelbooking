import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/feature/payment/screen/payment_page2.dart';

import '../../../core/image_page.dart';
import '../../../main.dart';

class newCard extends StatefulWidget {
  const newCard({super.key});

  @override
  State<newCard> createState() => _newCardState();
}

class _newCardState extends State<newCard> {
  final formKey=GlobalKey<FormState>();
  final numberValidation=RegExp(r"[0-9]{10}");

  TextEditingController nameController=TextEditingController();
  TextEditingController numberController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController cvvController=TextEditingController();
  GestureFlipCardController flipCardController=GestureFlipCardController();
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
        title: Text("New Card",
          style: TextStyle(
              color: colorPage.blackcolor,
              fontWeight: FontWeight.w700,
              fontSize: w*0.07
          ),),
      ),
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(w*0.02),
          child: Form(
            key: formKey,
            child: Container(
              height: h*0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: w*1.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureFlipCard(
                            frontWidget: Container(
                              padding: EdgeInsets.all(w*0.04),
                              height: w*0.6,
                              width: w*1,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(imagePage.creditCard),fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(w*0.05)
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: w*0.05,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Balance",style: GoogleFonts.sourceSans3(
                                            fontWeight: FontWeight.w400,
                                            color: colorPage.secondaryColor,
                                            fontSize: w*0.045
                                          ),),
                                          Text("\$1299.15",style: GoogleFonts.sourceSans3(
                                            fontWeight: FontWeight.w400,
                                            color: colorPage.secondaryColor,
                                            fontSize: w*0.09
                                          ),),
                                        ],
                                      ),
                                      SvgPicture.asset(imagePage.mastercardIcon,height: w*0.15,width: w*0.15,)
                                    ],
                                  ),
                                  SizedBox(height: w*0.05,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(height: w*0.05,),
                                          Text(dateController.text,style: TextStyle(
                                            color: colorPage.secondaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: w*0.06
                                          ),),
                                          SizedBox(height: w*0.02,),
                                          Text(numberController.text,style: TextStyle(
                                            fontSize: w*0.05,
                                            fontWeight: FontWeight.w700,
                                            color: colorPage.secondaryColor
                                          ),)
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            backWidget: Container(
                              height: w*0.6,
                              width: w*1,
                              padding: EdgeInsets.only(top: w*0.05),
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(imagePage.creditCard),fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(w*0.05)
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: w*0.15,
                                    width: w*1,
                                    color: colorPage.blackcolor,
                                  ),
                                  SizedBox(height: w*0.09,),
                                  Row(
                                    children: [
                                      Container(
                                        height: w*0.09,
                                        width: w*0.6,
                                        color: colorPage.secondaryColor,
                                      ),
                                      Container(
                                        height: w*0.07,
                                        width: w*0.09,
                                        color: colorPage.secondaryColor,
                                        child: Center(child: Text(cvvController.text)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                            fontSize: w*0.05,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "full name",
                            labelStyle: TextStyle(
                              fontSize: w*0.05,
                              fontWeight: FontWeight.w500,
                            ),
                            // hintText: "please enter your name",
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
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: numberController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                            fontSize: w*0.05,
                            fontWeight: FontWeight.w700,
                          ),
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            filled: true,
                            labelText: " card number",
                            labelStyle: TextStyle(
                              fontSize: w*0.05,
                              fontWeight: FontWeight.w400,
                            ),
                            // hintText: "please enter your number",
                            hintStyle: TextStyle(
                                color: colorPage.greycolor,
                                fontWeight: FontWeight.w700,
                                fontSize: w*0.05
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:colorPage.greycolor,
                                ),
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                              borderSide: BorderSide(
                                color: colorPage.blackcolor
                              )
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              numberController.text=value;
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: w*0.14,
                              width:w*0.43,
                              child: TextFormField(
                                controller: dateController,
                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.done,
                                style: TextStyle(
                                  fontSize: w*0.05,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  labelText: "date",
                                  labelStyle: TextStyle(
                                    fontSize: w*0.05,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  hintText: "MM/YYYY",
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
                                onChanged: (value) {
                                  setState(() {
                                    dateController.text=value;
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: w*0.14,
                              width: w*0.43,
                              child: TextFormField(
                                controller: cvvController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                maxLength: 3,
                                style: TextStyle(
                                  fontSize: w*0.05,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  counterText: "",
                                  filled: true,
                                  labelText: "cvv",
                                  labelStyle: TextStyle(
                                    fontSize: w*0.05,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  // hintText: "please enter your name",
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
                                      borderRadius: BorderRadius.circular(w*0.03)
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    cvvController.text=value;
                                  });
                                },
                              ),

                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if(
                        nameController.text!=""&&
                            numberController.text!=""&&
                            dateController.text!=""&&
                            cvvController.text!=""&&
                        formKey.currentState!.validate()
                        ){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => paymentPage2(card: numberController.text),));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted Successfully")));
                        }else{
                          nameController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter name"))):
                              numberController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter card number"))):
                              dateController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter date"))):
                              cvvController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter cvv number"))):
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your valid details")));
                        }
                      },
                      child: Container(
                        child: Center(
                          child: Text("Add New Card",
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
      ),

    );
  }
}
