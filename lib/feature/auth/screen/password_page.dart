import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbooking/feature/auth/screen/forgot_page2.dart';
import 'package:hotelbooking/feature/auth/screen/login_to.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/image_page.dart';

import '../../../main.dart';

class passwordPage extends StatefulWidget {
  const passwordPage({super.key});

  @override
  State<passwordPage> createState() => _passwordPageState();
}

class _passwordPageState extends State<passwordPage> {
  final formKey=GlobalKey<FormState>();
  final passwordValidatoin=RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");

  TextEditingController passwordController=TextEditingController();
  TextEditingController newPasswordController=TextEditingController();
  bool visibility=false;
  bool visibility2=false;
  bool tick=false;
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
        title: Text("Create New Password",
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
         child: Form(
           key:formKey,
           child: Container(
             height: h*0.9,
             width: w*1,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Container(
                  height: w*0.8,
                ),
                 Text("Create Your New Password",
                 style: TextStyle(
                   fontSize: w*0.05
                 ),),
                 Column(
                   children: [
                     TextFormField(
                       controller: passwordController,
                       keyboardType: TextInputType.visiblePassword,
                       textInputAction: TextInputAction.done,
                       maxLength: 8,
                       obscureText: visibility?false:true,
                       style: TextStyle(
                         fontSize: w*0.05,
                         fontWeight: FontWeight.w500,
                       ),
                       autovalidateMode: AutovalidateMode.onUserInteraction,
                       validator: (value) {
                         if(
                         !passwordValidatoin.hasMatch(value!)
                         ){
                           return ("Enter Valid Password");
                         }else{
                           return null;
                         }
                       },
                       decoration: InputDecoration(
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(w*0.03)
                         ),
                         filled: true,
                         fillColor: colorPage.lightgreycolor,
                         prefixIcon: InkWell(
                           onTap: () {
                             visibility=!visibility;
                             setState(() {
                             });
                           },
                           child: Icon(visibility?Icons.visibility:Icons.visibility_off,
                             color: colorPage.blackcolor,),),
                         hintText: "Password",
                         hintStyle: TextStyle(
                             color: colorPage.blackcolor,
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
                     SizedBox(height: w*0.03,),
                     TextFormField(
                       controller: newPasswordController,
                       keyboardType: TextInputType.visiblePassword,
                       textInputAction: TextInputAction.done,
                       maxLength: 8,
                       obscureText: visibility2?false:true,
                       style: TextStyle(
                         fontSize: w*0.05,
                         fontWeight: FontWeight.w500,
                       ),
                       autovalidateMode: AutovalidateMode.onUserInteraction,
                       validator: (value) {
                         if(
                         !passwordValidatoin.hasMatch(value!)
                         ){
                           return ("Enter Valid Password");
                         }else{
                           return null;
                         }
                       },
                       decoration: InputDecoration(
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(w*0.03)
                         ),
                         filled: true,
                         fillColor: colorPage.lightgreycolor,
                         prefixIcon: InkWell(
                           onTap: () {
                             visibility2=!visibility2;
                             setState(() {
                             });
                           },
                           child: Icon(visibility2?Icons.visibility:Icons.visibility_off,
                             color: colorPage.blackcolor,),),
                         hintText: "New Password",
                         hintStyle: TextStyle(
                             color: colorPage.blackcolor,
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
                     SizedBox(height: w*0.01,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Checkbox(
                           side:BorderSide(color: colorPage.primaryColor),
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(w*0.01)),
                           value: tick,
                           activeColor: colorPage.primaryColor,
                           onChanged: (value) {
                             setState(() {
                               tick=!tick;
                             });
                           },),
                         Text("Remember me",
                           style: TextStyle(
                               fontWeight: FontWeight.w500,
                               fontSize: w*0.045
                           ),)
                       ],
                     ),
                   ],
                 ),
                 SizedBox(height: w*0.03,),
                 InkWell(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => loginToYourAccount(),));
                   },
                   child: Center(
                     child: InkWell(
                       onTap: () {
                         if(
                         passwordController.text!=""&&
                             newPasswordController.text!=""&&
                             passwordController.text==newPasswordController.text&&
                             formKey.currentState!.validate()
                         ){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => loginToYourAccount(),));
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted SUCCESSFULLY")));
                         }else{
                           passwordController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter Password"))):
                           newPasswordController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please  re enter Password"))):
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please valid password")));
                         }

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
