import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelbooking/feature/auth/screen/lets_you_in.dart';
import 'package:hotelbooking/feature/auth/screen/login_to.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/image_page.dart';
import 'package:hotelbooking/indro/loading_page.dart';
import 'package:hotelbooking/indro/onbody_content.dart';
import '../../../main.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key, required this.googleSignIn});

  final bool googleSignIn;

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  final formKey=GlobalKey<FormState>();
  final numberValidation=RegExp(r"[0-9]{10}");
  final emailValidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordValidatoin=RegExp("");

  String imgUrl=("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKc6EnanoKKj61vCCamKeDwXelxNzUElzIWWDgf75XNEa1-uaHgiSq32hF7bp73Tq9nsY&usqp=CAU");


  // r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$"
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController numberController=TextEditingController();
  TextEditingController genderController=TextEditingController();


  String? valueChoose;

  var listItem=[
    "Male","Female","Other"
  ];

  saveData(){
    FirebaseFirestore.instance.
    collection('bolu').doc(emailController.text)
        .set(
        {
          "name": nameController.text,
          "password":passwordController.text,
          "email": emailController.text,
          "phone":numberController.text,
          "image":imgUrl

        }
    );
  }
  @override
  void initState() {
    if(widget.googleSignIn== true){
      emailController.text=user!.email.toString();
      nameController.text=user!.displayName.toString();
      imgUrl=user!.photoURL.toString();
    }
    // TODO: implement initState
    super.initState();
  }

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
      title: Text("Fill Your Profile",
        style: TextStyle(
            color: colorPage.blackcolor,
            fontWeight: FontWeight.w700,
            fontSize: w*0.07
        ),),
    ),
      body: Form(
        key: formKey,
        child: Padding(
          padding:  EdgeInsets.all(w*0.03),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: h*0.9,
              width: w*1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: w*0.05,),
                  Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(imgUrl),
                          radius: 80,
                        ),
                      ),
                      Text(widget.googleSignIn.toString()),
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
                      SizedBox(height: w*0.04,),
                      TextFormField(
                        onTap: () async {
                       var date = await   showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1000), lastDate: DateTime(4000));
                          dateController.text = date.toString().substring(0,10);

                        },
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
                              child: SvgPicture.asset(imagePage.dateandbirthIcon)),
                          labelText: "Date of Birth",
                          labelStyle: TextStyle(
                            fontSize: w*0.06,
                            fontWeight: FontWeight.w500,
                          ),
                          hintText: "YYYY/MM/DD",
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
                      SizedBox(height: w*0.04,),
                      TextFormField(
                        readOnly: widget.googleSignIn,
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.03)
                          ),
                          filled: true,
                          fillColor: colorPage.lightgreycolor,
                          suffixIcon: Container(
                            height: w*0.03,
                            width: w*0.03,
                            margin: EdgeInsets.all(w*0.030),
                            child:
                            SvgPicture.asset(imagePage.messageIcon),),
                          // suffixText: "text",
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: w*0.06,
                            fontWeight: FontWeight.w500,
                          ),
                          // hintText: "please enter your email",
                          // hintStyle: TextStyle(
                          //     color: colorPage.greycolor,
                          //     fontWeight: FontWeight.w500,
                          //     fontSize: width*0.05
                          // ),
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
                      SizedBox(height: w*0.04,),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                          fontSize: w*0.05,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          labelText: "password",
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
                      SizedBox(height: w*0.04,),
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
                            initialSelection: 'IN',
                            favorite: ['+91','IN'],
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
                      SizedBox(height: w*0.04,),
                      Center(
                        child: Container(
                          height: w*0.16,
                          padding: EdgeInsets.only(left: w*0.03,right:w*0.03),
                          decoration: BoxDecoration(
                            color: colorPage.lightgreycolor,
                            border:Border.all(color:colorPage.greycolor,),
                            borderRadius: BorderRadius.circular(w*0.03),),
                          child: DropdownButton(
                            isExpanded: true,
                            hint: Text("Gender",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: w*0.05
                            ),),
                            dropdownColor: colorPage.greycolor,
                            icon: SvgPicture.asset(imagePage.downarrowIcon),
                            underline: SizedBox(),
                            style: TextStyle(
                                fontSize: w*0.05,
                                color: colorPage.blackcolor,
                              fontWeight: FontWeight.w300
                            ),
                            value: valueChoose,
                            items: listItem.map((valueItem){
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem,
                                    style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: w*0.05
                                ),),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                valueChoose=newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if(
                        nameController.text!=""&&
                        passwordController.text!=""&&
                        dateController.text!=""&&
                        emailController.text!=""&&
                        numberController.text!=""&&
                            valueChoose!=null&&
                        formKey.currentState!.validate()
                        ){
                          saveData();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => loginToYourAccount(),));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted SUCCESSFULLY")));
                        }else{
                          nameController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Name"))):
                              passwordController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your NickName"))):
                              dateController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter Date"))):
                              emailController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your Email"))):
                              numberController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter valid Number"))):
                              valueChoose==null?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please select Gender"))):
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your valid details")));
                        }

                      },
                      child: Container(
                        child: Center(child: Text("Sign in with password",
                          style: TextStyle(
                              fontSize: w*0.052,
                              fontWeight: FontWeight.w600,
                              color: colorPage.secondaryColor
                          ),)),
                        height: w*0.15,
                        width: w*0.85,
                        decoration: BoxDecoration(
                            color: colorPage.primaryColor,
                            borderRadius:BorderRadius.circular(w*0.1),
                            boxShadow:[
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 2,
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
