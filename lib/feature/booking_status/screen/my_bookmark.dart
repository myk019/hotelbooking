import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/image_page.dart';

import '../../../main.dart';

class myBookmark extends StatefulWidget {
  const myBookmark({super.key});

  @override
  State<myBookmark> createState() => _myBookmarkState();
}

class _myBookmarkState extends State<myBookmark> {
  List hotelrooms=[
    {
      "image":imagePage.image1,
      "text1":"Intercontinental Hotel",
      "text5":"\$205",
    },
    {
      "image":imagePage.image2,
      "text1":"Nevada Hotel",
      "text5":"\$107",
    },
    {
      "image":imagePage.image3,
      "text1":"Oriental Hotel",
      "text5":"\$190",

    },
    {
      "image":imagePage.image4,
      "text1":"Federal Palace Hotel",
      "text5":"\$200",
    },
    {
      "image":imagePage.image5,
      "text1":"Presidential Hotel",
      "text5":"\$160",
    },
    {
      "image":imagePage.image6,
      "text1":"Presidential Hotel",
      "text5":"\$200",
    },
  ];
  List bookmark=[];
  bool list=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.sixthcolor,
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
        title: Text("My Bookmark",
          style: TextStyle(
              color: colorPage.blackcolor,
              fontWeight: FontWeight.w700,
              fontSize: w*0.07
          ),),
        actions: [
          InkWell(
              onTap: () {
                list=true;
                setState(() {

                });
              },
              child: SvgPicture.asset(list==true?imagePage.vara3Icon:imagePage.vara3Icon2)),
          SizedBox(width:w*0.03),
          InkWell(
              onTap: () {
                list=false;
                setState(() {

                });
              },
              child: SvgPicture.asset(list==true?imagePage.pettiIcon:imagePage.pettiIcon2)),
          SizedBox(width: w*0.03,)
        ],
      ),
      body:  Padding(
        padding:  EdgeInsets.all(w*0.03),
        child:list==true? ListView.separated(
            itemCount: hotelrooms.length,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, index) {
              return Container(
                // margin: EdgeInsets.all(w*0.01),
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
                      height: w*0.28,
                      width: w*0.27,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(hotelrooms[index]["image"]),fit: BoxFit.fill),
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
                          Text(hotelrooms[index]["text1"],
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
                    Padding(
                      padding: EdgeInsets.only(top: w*0.06),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(hotelrooms[index]["text5"],
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
      ): GridView.builder(
          itemCount: hotelrooms.length,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              // crossAxisSpacing: w*0.03,
              mainAxisSpacing: w*0.001,
              childAspectRatio: 0.65),
          itemBuilder: (BuildContext context,index) {
            return Container(
              margin: EdgeInsets.all(w*0.02),
              height: w*0.3,
              width: w*0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.03),
                  color:colorPage.secondaryColor
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(w*0.03),
                    height: w*0.35,
                    width: w*0.38,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(w*0.03),
                        image: DecorationImage(image: AssetImage(hotelrooms[index]["image"]),fit: BoxFit.fill)
                    ),
                  ),
                  SizedBox(height: w*0.01,),
                  Padding(
                    padding: EdgeInsets.only(left: w*0.016),
                    child: Column(
                      children: [
                        Text(hotelrooms[index]["text1"],
                          style: TextStyle(
                              fontSize: w*0.05,
                              fontWeight: FontWeight.w700
                          ),),
                        SizedBox(height: w*0.02,),
                        Padding(
                          padding: EdgeInsets.only(left: w*0.02),
                          child: Row(
                            children: [
                              SvgPicture.asset(imagePage.starIcon,color: colorPage.yellowcolor,),
                              Text("5.0",style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: w*0.045,
                                  color: colorPage.primaryColor
                              ),),
                              SizedBox(width: w*0.02,),
                              Text("Lagos, Nigeria",style: TextStyle(
                                  fontSize: w*0.045,
                                  fontWeight: FontWeight.w400
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height: w*0.02,),
                        Padding(
                          padding: EdgeInsets.only(left: w*0.03),
                          child: Row(
                            children: [
                              Text(hotelrooms[index]["text5"],style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: w*0.05,
                                color: colorPage.primaryColor,
                              ),),
                              SizedBox(width: w*0.01,),
                              Text("/night",style: TextStyle(
                                  fontSize: w*0.03,
                                  fontWeight: FontWeight.w400
                              ),),
                              SizedBox(width: w*0.08,),
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },

        ),
    ));
  }
}
