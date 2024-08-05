import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/image_page.dart';

import '../main.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  bool Grid=true;
  TextEditingController searchController=TextEditingController();
  int selectIndex=0;
  List bookmark=[];
  // List category=["All hotel","Recommended","popular","Trending","Top star"];
  String selectedCategory = '';
  List rooms=[
    {
      "image":imagePage.image1,
      "text1":"Intercontinental Hotel",
      "text5":"\$205",
    },
    {
      "image":imagePage.image1,
      "text1":"Nevada Hotel",
      "text5":"\$205",
    },
    {
      "image":imagePage.image1,
      "text1":"Oriental Hotel",
      "text5":"\$205",

    },
    {
      "image":imagePage.image1,
      "text1":"Federal Palace Hotel",
      "text5":"\$205",
    },
    {
      "image":imagePage.image1,
      "text1":"Presidential Hotel",
      "text5":"\$205",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: colorPage.secondaryColor,elevation: 0),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: w*0.02,right: w*0.02),
            height: w*0.4,
              width: w*1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: w*0.16,
                    width: w*1,
                    child: Padding(
                      padding: EdgeInsets.only(left: w*0.05,right: w*0.05,top: w*0.02),
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
                  // SizedBox(height: w*0.03,),
                  Container(
                    // margin: EdgeInsets.only(left: w*0.03,right: w*0.03),
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
                                selectedCategory= category[index]["Category"];
                                if(selectedCategory == 'All hotel'){
                                  selectedCategory = '';
                                }
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
                          separatorBuilder: (BuildContext
                          context, index) {
                            return SizedBox(width: w*0.03,);
                          },
                        );
                      }
                    ),
                  ),
                  // SizedBox(height: w*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recommended  (484,579)",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: w*0.05
                      ),),
                      SizedBox(width: w*0.2,),
                      InkWell(
                          onTap: () {
                            Grid=true;
                            setState(() {

                            });
                          },
                          child: SvgPicture.asset(Grid==true?imagePage.vara3Icon:imagePage.vara3Icon2)),
                      InkWell(
                          onTap: () {
                            Grid=false;
                            setState(() {

                            });
                          },
                          child: SvgPicture.asset(Grid==true?imagePage.pettiIcon:imagePage.pettiIcon2)),
                      SizedBox(width: w*0.02,)
                    ],
                  ),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream:
              selectedCategory ==''?
              FirebaseFirestore.instance.collection("Hotel").snapshots():
              FirebaseFirestore.instance.collection("Hotel").where("category",isEqualTo: selectedCategory).snapshots(),
              builder: (context, snapshot) {

                if(!snapshot.hasData){

                  return CircularProgressIndicator();
                }

                var rooms=snapshot.data!.docs;

                return Column(
                  children: [
                Container(
                  padding: EdgeInsets.all(w*0.02),
                  color: colorPage.sixthcolor,
                  height: h*0.628,
                  width: w*1,
                  child: Grid==true?ListView.separated(
                      itemCount: rooms.length,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          // margin: EdgeInsets.all(w*0.01),
                          width: w*1.5,
                          height: w*0.35,
                          decoration: BoxDecoration(
                              color: colorPage.secondaryColor,
                              borderRadius: BorderRadius.circular(w*0.04)
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(w*0.03),
                                height: w*0.28,
                                width: w*0.27,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: NetworkImage(rooms[index]["image"]),fit: BoxFit.fill),
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
                                    Text(rooms[index]["name"],
                                      style: TextStyle(
                                          fontSize: w*0.05,
                                          fontWeight: FontWeight.w700
                                      ),),
                                    SizedBox(height: w*0.05,),
                                    Text("Lagos, Nigeria",
                                      style: TextStyle(
                                          fontSize: w*0.04,
                                          fontWeight: FontWeight.w400
                                      ),),
                                    SizedBox(height: w*0.04,),
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
                              Container(
                                height: w*0.25,
                                width: w*0.15,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(rooms[index]["price"].toString(),
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
                                    SizedBox(height: w*0.045,),
                                    InkWell(
                                        onTap: () {
                                          if(bookmark.contains(index)){
                                            bookmark.remove(index);
                                          }else{
                                            bookmark.add(index);
                                          }
                                          setState(() {
                                          });
                                        },
                                        child: SvgPicture.asset(imagePage.bookMarkIcon,color: bookmark.contains(index)?colorPage.primaryColor:colorPage.blackcolor,))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: w * 0.04,);
                      }
                  ):GridView.builder(
                    shrinkWrap: true,
                    itemCount: rooms.length,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,
                        // crossAxisSpacing: w*0.03,
                        mainAxisSpacing: w*0.001,
                        childAspectRatio: 0.65),
                    itemBuilder: (BuildContext context,index) {
                      return Container(
                        margin: EdgeInsets.all(w*0.02),
                        // height: w*0.5,
                        // width: w*0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w*0.03),
                            color:colorPage.secondaryColor
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: w*0.35,
                              width: w*0.38,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(w*0.03),
                                  image: DecorationImage(image: NetworkImage(rooms[index]["image"]),fit: BoxFit.fill)
                              ),
                            ),
                            Container(
                              height: w*0.25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(rooms[index]["name"],
                                    style: TextStyle(
                                        fontSize: w*0.045,
                                        fontWeight: FontWeight.w700
                                    ),),
                                  Container(
                                    width: w*0.35,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(imagePage.starIcon,color: colorPage.yellowcolor,),
                                        Text("5.0",style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: w*0.04,
                                            color: colorPage.primaryColor
                                        ),),
                                        SizedBox(width: w*0.02,),
                                        Text("Lagos, Nigeria",style: TextStyle(
                                            fontSize: w*0.04,
                                            fontWeight: FontWeight.w400
                                        ),),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: w*0.35,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(rooms[index]["price"].toString(),style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: w*0.045,
                                              color: colorPage.primaryColor,
                                            ),),
                                            Text("/night",style: TextStyle(
                                                fontSize: w*0.03,
                                                fontWeight: FontWeight.w400
                                            ),),
                                          ],
                                        ),
                                        InkWell(
                                            onTap: () {
                                              if(bookmark.contains(index)){
                                                bookmark.remove(index);
                                              }else{
                                                bookmark.add(index);
                                              }
                                              setState(() {

                                              });
                                            },
                                            child: SvgPicture.asset(imagePage.bookMarkIcon,color: bookmark.contains(index)?colorPage.primaryColor:colorPage.blackcolor,))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },

                  ),
                ),

                  ],
                );
              }
            )
          ],
        ),
      ),

    );
  }
}
