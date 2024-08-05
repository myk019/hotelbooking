import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelbooking/feature/auth/screen/create_account.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/home/recently_booked.dart';
import 'package:hotelbooking/image_page.dart';
import 'package:hotelbooking/model/user_model.dart';

import '../../../main.dart';
import '../../booking_status/screen/my_bookmark.dart';
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  TextEditingController searchController=TextEditingController();
  int selectIndex=0;
  List bookmark=[];
  List category=["All hotel","Recommended","popular","Trending","Top star"];
  // List hotelRoom=[
  //   {
  //     "image":imagePage.image1,
  //     "text":"Intercontinental Hotel",
  //     "text1":"Lagos, Nigeria",
  //     "text2":"\$205 ",
  //     "text3":"/night"
  //   },
  //   {
  //     "image":imagePage.image2,
  //     "text":"Intercontinental Hotel",
  //     "text1":"Lagos, Nigeria",
  //     "text2":"\$205 ",
  //     "text3":"/night"
  //   },
  //   {
  //     "image":imagePage.image3,
  //     "text":"Intercontinental Hotel",
  //     "text1":"Lagos, Nigeria",
  //     "text2":"\$205 ",
  //     "text3":"/night"
  //   },
  //   {
  //     "image":imagePage.image4,
  //     "text":"Intercontinental Hotel",
  //     "text1":"Lagos, Nigeria",
  //     "text2":"\$205 ",
  //     "text3":"/night"
  //   }
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.secondaryColor,
        leading: Padding(
          padding: EdgeInsets.only(left: w*0.02,top: w*0.02),
          child: Container(
            height: w*0.01,
              width: w*0.01,
              child: SvgPicture.asset(imagePage.boluIcon,
              height: w*0.01,
              width: w*0.01,)),
        ),
        title: Text("Bolu",
        style: TextStyle(
          fontSize: w*0.08,
          fontWeight: FontWeight.w700,
            color: colorPage.blackcolor
        ),),
        actions: [
          SvgPicture.asset(imagePage.ringNotificationIcon),
          SizedBox(width:w*0.02),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => myBookmark(),));
              },
              child: SvgPicture.asset(imagePage.bookMarkIcon)),
          SizedBox(width:w*0.03),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.only(left: w*0.03,right: w*0.03,top: w*0.03),
          child: Container(
            height: h*0.8,
            width: w*1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello,${userName}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: w*0.095
                    ),),
                    SizedBox(height: w*0.05,),
                    Container(
                      height: w*0.16,
                      width: w*1,
                      child: Padding(
                        padding: EdgeInsets.only(left: w*0.02,right: w*0.02,top: w*0.02),
                        child: TextFormField(
                          controller: searchController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                            fontSize: w*0.045,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            constraints: BoxConstraints(
                                minHeight: w*0.05,
                                minWidth: w*0.9
                            ),
                            filled: true,
                            labelText: "Search",
                            prefixIcon: Container(
                              height: w*0.01,
                              width: w*0.01,
                              padding: EdgeInsets.all(w*0.025),
                              child: Padding(
                                padding:  EdgeInsets.all(w*0.01),
                                child: SvgPicture.asset(imagePage.searchIcon,
                                  color: colorPage.greycolor,),
                              ),
                            ),
                            suffixIcon: Container(
                              height: w*0.01,
                              width: w*0.01,
                              padding: EdgeInsets.all(w*0.035),
                              child: SvgPicture.asset(imagePage.roundLineIcon),
                            ),

                            labelStyle: TextStyle(
                                fontSize: w*0.045,
                                fontWeight: FontWeight.w400,
                                color: colorPage.greycolor
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:colorPage.lightgreycolor,
                                ),
                                borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorPage.greycolor,
                                ),
                                borderRadius: BorderRadius.circular(w*0.02)
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: w*0.05,),
                    Container(
                      height: w*0.1,
                      width: w*1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.03),
                      ),
                      child:StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection("Categories").snapshots(),
                        builder: (context, snapshot) {

                          if(!snapshot.hasData){

                            return CircularProgressIndicator();

                          }
                          var category=snapshot.data!.docs;

                          return ListView.separated(
                              itemCount: category.length,
                          physics: BouncingScrollPhysics(),
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
                                    // width: w*0.2,
                                    padding: EdgeInsets.all(w*0.02),
                                    decoration: BoxDecoration(
                                      color: selectIndex==index?colorPage.primaryColor:colorPage.secondaryColor,
                                      borderRadius: BorderRadius.circular(w*0.05),
                                      border: Border.all(color: colorPage.primaryColor)
                                    ),
                                    child: Center(child: Text(category[index].id,
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
                          );
                        }
                      ),

                    ),
                    SizedBox(height: w*0.05,),
                  ],
                ),
                // Container(height: w*0.1,width: w*1,),
                Column(
                  children: [
                    Container(
                      height: w*0.9,
                        width: w*1,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection("Hotel").snapshots(),
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return CircularProgressIndicator();
                          }

                          var hotelRoom=snapshot.data!.docs;

                          return ListView.separated(
                              itemCount: hotelRoom.length,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {

                                });
                              },
                              child: Stack(
                                children:[ Container(
                                  height: w*1,
                                  width: w*0.65,
                                  padding: EdgeInsets.only(left: w*0.02,right: w*0.02),
                                  decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(hotelRoom[index]["image"]),fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(w*0.09),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(left: w*0.018,bottom: w*0.015),
                                        child: Text(hotelRoom[index]["name"],
                                        style: TextStyle(
                                          color: colorPage.secondaryColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: w*0.055
                                        ),),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(left: w*0.02,bottom: w*0.02),
                                        child: Text(hotelRoom[index]["place"],
                                        style: TextStyle(
                                          color: colorPage.secondaryColor,
                                          fontWeight: FontWeight.w500

                                        ),),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(left: w*0.02,bottom: w*0.055),
                                            child: Text(hotelRoom[index]["price"].toString(),
                                            style: TextStyle(
                                              color: colorPage.secondaryColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: w*0.05
                                            ),),
                                          ),
                                          Text(hotelRoom[index]["name"],
                                          style: TextStyle(
                                            color: colorPage.secondaryColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 0.02
                                          ),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                  // SizedBox(height: w*0.02,),
                                  Positioned(
                                    left: w*0.47,
                                    top: w*0.09,
                                    child: Container(
                                      height: w*0.07,
                                      width: w*0.15,
                                      decoration: BoxDecoration(
                                        color: colorPage.primaryColor,
                                        borderRadius: BorderRadius.circular(w*0.04),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: w*0.022),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: w*0.05,
                                              width: w*0.05,
                                              child:
                                              SvgPicture.asset(imagePage.starIcon),
                                            ),
                                            Container(
                                              child: Text("5.0",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: w*0.042,
                                                color: colorPage.secondaryColor
                                              ),),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: w*0.53,
                                      bottom: w*0.1,
                                      child: InkWell(
                                          onTap: () {
                                            if(bookmark.contains(index)){
                                              bookmark.remove(index);
                                            }else{
                                              bookmark.add(index);
                                            }
                                            setState(() {

                                            });
                                          },
                                          child: SvgPicture.asset(imagePage.bookMarkIcon,color:bookmark.contains(index)?colorPage.primaryColor:colorPage.secondaryColor)))
                              ]
                              ),
                            );
                          },
                            separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(width: w*0.04,);
                          },);
                        }
                      ),
                    ),
                    SizedBox(height: w*0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recently Booked",
                        style: TextStyle(
                          fontSize: w*0.055,
                          fontWeight: FontWeight.w600
                        ),),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => recentlyBooked(),));
                          setState(() {

                          });},
                          child: Text("See All",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: w*0.05,
                            color: colorPage.primaryColor
                          ),),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
