import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/feature/payment/screen/payment_page.dart';


import '../../../core/image_page.dart';
import '../../../main.dart';

class nameofReservation extends StatefulWidget {
  const nameofReservation({super.key});

  @override
  State<nameofReservation> createState() => _nameofReservationState();
}

class _nameofReservationState extends State<nameofReservation> {
  List category=["Mr.","Mrs.","Ms"];
  int selectIndex=0;
  final formKey=GlobalKey<FormState>();
  final numberValidation=RegExp(r"[0-9]{10}");
  final emailValidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordValidation=RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");

  TextEditingController nameController=TextEditingController();
  TextEditingController nicknameController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController numberController=TextEditingController();
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
        title: Text("Name of Reservation",
          style: TextStyle(
              color: colorPage.blackcolor,
              fontWeight: FontWeight.w700,
              fontSize: w*0.07
          ),),
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(w*0.03),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: w*0.1,
                  width: w*1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.03),
                  ),
                  child:ListView.separated(
                    itemCount: category.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index){
                      return InkWell(
                        onTap: () {
                          selectIndex=index;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: w*0.04,
                          width: w*0.3,
                          padding: EdgeInsets.all(w*0.02),
                          decoration: BoxDecoration(
                              color: selectIndex==index?colorPage.primaryColor:colorPage.secondaryColor,
                              borderRadius: BorderRadius.circular(w*0.05),
                              border: Border.all(color: colorPage.primaryColor)
                          ),
                          child: Center(child: Text(category[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: selectIndex==index?colorPage.secondaryColor:colorPage.primaryColor
                            ),),),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, index) {
                      return SizedBox(width: w*0.03,);
                    },
                  ),

                ),
                Container(
                  height: h*0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: w*1.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                                labelText: "Full Name",
                                labelStyle: TextStyle(
                                  fontSize: w*0.06,
                                  fontWeight: FontWeight.w500,
                                ),
                                hintText: "please enter your name",
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
              TextFormField(
                            controller: nicknameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                              fontSize: w*0.05,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              labelText: "Nickname",
                              labelStyle: TextStyle(
                                fontSize: w*0.06,
                                fontWeight: FontWeight.w500,
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
              TextFormField(
                            controller: dateController,
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                              fontSize: w*0.05,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              suffixIcon: Container(
                                  height: w*0.03,
                                  width: w*0.03,
                                  margin: EdgeInsets.all(w*0.030),
                                  child: Padding(
                                    padding:  EdgeInsets.all(w*0.004),
                                    child: SvgPicture.asset(imagePage.dateandbirthIcon),
                                  )),
                              labelText: "Date of Birth",
                              labelStyle: TextStyle(
                                fontSize: w*0.06,
                                fontWeight: FontWeight.w500,
                              ),
                              hintText: "DD/MM/YYYY",
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
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.02)
                              ),
                              filled: true,
                              fillColor: colorPage.lightgreycolor,
                              suffixIcon: Container(
                                height: w*0.03,
                                width: w*0.03,
                                margin: EdgeInsets.all(w*0.030),
                                child:
                                Padding(
                                  padding: EdgeInsets.all(w*0.001),
                                  child: SvgPicture.asset(imagePage.messageIcon),
                                ),),
                              // suffixText: "text",
                              labelText: "Email",
                              labelStyle: TextStyle(
                                fontSize: w*0.06,
                                fontWeight: FontWeight.w500,
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
              TextFormField(
                            controller: numberController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                              fontSize: w*0.05,
                              fontWeight: FontWeight.w700,
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if(
                              !numberValidation.hasMatch(value!)
                              ){
                                return "Enter Valid Number";
                              }
                              else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(w*0.03)
                              ),
                              prefixIcon: CountryCodePicker(
                                onChanged: print,
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'IT',
                                favorite: ['+39','FR'],
                                // optional. Shows only country name and flag
                                showCountryOnly: false,
                                // optional. Shows only country name and flag when popup is closed.
                                showOnlyCountryWhenClosed: false,
                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                              ),
                              filled: true,
                              labelText: " Phone Number",
                              labelStyle: TextStyle(
                                fontSize: w*0.055,
                                fontWeight: FontWeight.w400,
                              ),
                              hintText: "please enter your number",
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
                                  borderSide: BorderSide(
                                    color: colorPage.blackcolor,
                                  ),
                                  borderRadius: BorderRadius.circular(w*0.03)
                              ),
                            ),
              ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if(
                          nameController.text!=""&&
                              nicknameController.text!=""&&
                              dateController.text!=""&&
                              emailController.text!=""&&
                              numberController.text!=""&&
                              formKey.currentState!.validate()
                          ){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => paymentPage(),));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted SUCCESSFULLY")));
                          }else{
                            nameController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Name"))):
                            nicknameController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your NickName"))):
                            dateController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter Date"))):
                            emailController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Email"))):
                            numberController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter valid Number"))):
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your valid details")));
                          }
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
  ],),
          ),
        ),
      )
    );

  }
}
