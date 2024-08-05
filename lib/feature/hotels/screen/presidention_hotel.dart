import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/home/select_date.dart';
import 'package:hotelbooking/image_page.dart';
import 'package:readmore/readmore.dart';

import '../../main.dart';

class presidentialHotel extends StatefulWidget {
  const presidentialHotel({super.key, required this.image, required this.name, required this.place, required this.description});
  final String image;
  final String name;
  final String place;
  final String description;

  @override
  State<presidentialHotel> createState() => _presidentialHotelState();
}

class _presidentialHotelState extends State<presidentialHotel> {
  bool seeAll=true;
  bool more=false;
  List photos=[
    imagePage.image8,
    imagePage.image9,
    imagePage.image7
  ];
  List review=[
    {
      "image":imagePage.othawa,
      "name":"Ivande Othawa",
      "text":"Very nice and comfortable hotel, thank you for accompanying my vacation!"
    },
    {
      "image":imagePage.davies,
      "name":"Nonso Davies",
      "text":"The rooms are very elegant and the natural views are amazing can’t wait to come back again"
    },
    {
      "image":imagePage.peter,
      "name":"Peter Shege",
      "text":"Very nice hotel, my friends and I are very satisfied with the service!"
    },
    {
      "image":imagePage.peter,
      "name":"Peter Shege",
      "text":"Very nice hotel, my friends and I are very satisfied with the service!"
    },
    {
      "image":imagePage.peter,
      "name":"Peter Shege",
      "text":"Very nice hotel, my friends and I are very satisfied with the service!"
    },
  ];
  String content=("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt aliqua. Read more...");
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
        title: Text(widget.name,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: w*0.07,
          color: colorPage.blackcolor
        ),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: h*2.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: w*0.7,
                width: w*1,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.fill)
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: w*0.04),
                child: Text(widget.name,style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: w*0.08,
                ),),
              ),
              Container(
                margin: EdgeInsets.only(left: w*0.14),
                child: Row(
                  children: [
                    SvgPicture.asset(imagePage.locationIcon),
                    Text(widget.place,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: w*0.04
                    ),),
                  ],
                ),
              ),
              Divider(
                indent: w*0.02,
                endIndent: w*0.02,
                height: w*0.04,
                thickness: w*0.002,
                color: colorPage.blackcolor.withOpacity(0.25),
              ),
              Padding(
                padding: EdgeInsets.only(left: w*0.02,right: w*0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Gallery Photos",
                      style: TextStyle(
                          fontSize: w*0.055,
                          fontWeight: FontWeight.w600
                      ),),
                    InkWell(
                      onTap: () {
                        seeAll=false;
                        setState(() {

                        });
                      },
                      child: seeAll==true?Text("See All",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: w*0.05,
                            color: colorPage.primaryColor
                        ),):InkWell(
                        onTap: () {
                          seeAll=true;
                          setState(() {

                          });
                        },
                          child: Text("See Less",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: w*0.05,
                              color: colorPage.primaryColor
                          ),),
                        )
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:w*0.02),
                height: w*0.34,
                width: w*1,
                child: seeAll==true?StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance.collection("Hotel").doc(widget.name).snapshots(),
                  builder: (context, snapshot) {

                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }

                    var hotels=snapshot.data!["image2"];
                    
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemCount: hotels.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: w*0.03,
                            width: w*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03),
                              image: DecorationImage(image: NetworkImage(hotels[index]),fit: BoxFit.fill)
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: w*0.03,);
                        },
                        );
                  }
                ):StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance.collection("Hotel").doc(widget.name).snapshots(),
                  builder: (context, snapshot) {

                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }

                    var hotels=snapshot.data!["image2"];


                    return GridView.builder(
                      itemCount: hotels.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1,
                            mainAxisSpacing: w*0.03,
                            crossAxisSpacing: w*0.03,
                            crossAxisCount: 2), itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: w*0.03,
                            width: w*0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.03),
                                image: DecorationImage(image: NetworkImage(hotels[index]),fit: BoxFit.fill)
                            ),
                          );
                    },
                    );
                  }
                )
              ),
              Container(
                margin: EdgeInsets.only(left: w*0.02),
                child: Text("Details",
                style: TextStyle(
                  fontSize: w*0.055,
                  fontWeight: FontWeight.w600
                ),),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(imagePage.hotelIcon),
                      Text("Hotels")
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(imagePage.bedroomsIcon),
                      Text("4 Bedrooms")
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(imagePage.bathIcon),
                      Text("2 Bathrooms")
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(imagePage.sqftIcon),
                      Text("3000 sqft")
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: w*0.02),
                child: Text("Description",style: TextStyle(
                  fontSize: w*0.05,
                  fontWeight: FontWeight.w600
                ),),
              ),
              Padding(
                padding: EdgeInsets.all(w*0.02),
                child: ReadMoreText(widget.description,
                trimLines: 3,
                textAlign: TextAlign.justify,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Read More",
                trimExpandedText: "Show Less",
                lessStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: w*0.04,
                  color: colorPage.primaryColor
                ),
                moreStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: w*0.04,
                  color: colorPage.primaryColor
                ),
                style:TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: w*0.045
                ),),
              ),
              Container(
                margin: EdgeInsets.only(left: w*0.02),
                child: Text("Facilities",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: w*0.055),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(imagePage.swimmingPoolIcon),
                      Text("Swimming Pool"),
                      SizedBox(height: w*0.02,),
                      SvgPicture.asset(imagePage.meetingRoomIcon),
                      Text("Meeting Room")
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(imagePage.wiFiIcon),
                      Text("WiFi"),
                      SizedBox(height: w*0.02,),
                      SvgPicture.asset(imagePage.elevatorIcon),
                      Text("Elevator")
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(imagePage.restaurentIcon),
                      Text("Restaurent"),
                      SizedBox(height: w*0.04,),
                      SvgPicture.asset(imagePage.fitnessIcon),
                      Text("Fitness Center"),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(imagePage.parkingIcon),
                      Text("Parking"),
                      SizedBox(height: w*0.02,),
                      SvgPicture.asset(imagePage.hours24Icon),
                      Text("24-hours Open"),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: w*0.02),
                child:
                Text("Location",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: w*0.055
                ),),
              ),
              Container(
                margin: EdgeInsets.all(w*0.03),
                height: w*0.5,
                width:w*1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.03),
                 image: DecorationImage(image: AssetImage(imagePage.map),fit: BoxFit.fill)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:w*0.02),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Review",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: w*0.055
                    ),),
                    SizedBox(width: w*0.05,),
                    Row(
                      children: [
                        SvgPicture.asset(imagePage.starIcon,color: colorPage.yellowcolor,),
                        Text("5.0",style: TextStyle(
                          color: colorPage.primaryColor,
                          fontWeight: FontWeight.w600
                        ),),
                        Text("(4,345 reviews)",style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                    SizedBox(width: w*0.27,),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(w*0.03),
                      child:more==true?ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            height: w*0.37,
                            width: w*1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03),
                              color: colorPage.secondaryColor,
                              boxShadow: [
                                BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 3,
                                color: colorPage.blackcolor.withOpacity(0.15),
                                offset: Offset(0, 4)
                                )]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListTile(
                                  leading:Container(
                                    height: w*0.2,
                                    width: w*0.2,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image: AssetImage(review[index]["image"]))
                                    ),
                                  ),
                                  title: Text(review[index]["name"],style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: w*0.05
                                  ),),
                                  subtitle: Text("Jan 20, 2025",style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: w*0.04
                                  ),),
                                  trailing: Container(
                                    height: w*0.07,
                                  width: w*0.13,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(w*0.04),
                                    color: colorPage.primaryColor
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(imagePage.starIcon,color: colorPage.secondaryColor,height: w*0.033,width: w*0.033,),
                                      Center(
                                        child: Text("5.0",style: TextStyle(
                                          color: colorPage.secondaryColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: w*0.033
                                        ),),
                                      ),
                                    ],
                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(w*0.02),
                                  child: Text(review[index]["text"],
                                  style: TextStyle(
                                    fontSize: w*0.042,
                                    fontWeight: FontWeight.w400
                                  ),),
                                )

                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: w*0.03,);
                        },
                        itemCount: review.length,):ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            height: w*0.37,
                            width: w*1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.03),
                                color: colorPage.secondaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 3,
                                      color: colorPage.blackcolor.withOpacity(0.15),
                                      offset: Offset(0, 4)
                                  )]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListTile(
                                  leading:Container(
                                    height: w*0.2,
                                    width: w*0.2,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(image: AssetImage(review[index]["image"]))
                                    ),
                                  ),
                                  title: Text(review[index]["name"],style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: w*0.05
                                  ),),
                                  subtitle: Text("Jan 20, 2025",style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: w*0.04
                                  ),),
                                  trailing: Container(
                                    height: w*0.07,
                                    width: w*0.13,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(w*0.04),
                                        color: colorPage.primaryColor
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(imagePage.starIcon,color: colorPage.secondaryColor,height: w*0.033,width: w*0.033,),
                                        Center(
                                          child: Text("5.0",style: TextStyle(
                                              color: colorPage.secondaryColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: w*0.033
                                          ),),
                                        ),
                                      ],
                                    ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(w*0.02),
                                  child: Text(review[index]["text"],
                                    style: TextStyle(
                                        fontSize: w*0.042,
                                        fontWeight: FontWeight.w400
                                    ),),
                                )

                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: w*0.03,);
                        },
                        itemCount: 3,),
                    ),
                    InkWell(
                      onTap: () {
                        more=!more;
                        setState(() {

                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(w*0.03),
                        height: w*0.13,
                        width: w*1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.05),
                          color: colorPage.sixthcolor
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: more==true?Text("Less",style: TextStyle(
                                fontSize: w*0.045,
                                fontWeight: FontWeight.w600,
                                color: colorPage.primaryColor
                              ),):Text("More",style: TextStyle(
                                  fontSize: w*0.045,
                                  fontWeight: FontWeight.w600,
                                  color: colorPage.primaryColor
                              ),),
                            ),
                            Icon(more==true?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined,color: colorPage.primaryColor,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: w*0.25,
        width: w*1,
        color: colorPage.secondaryColor,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              indent: w*0.02,
              endIndent: w*0.02,
              height: w*0.04,
              thickness: w*0.002,
              color: colorPage.blackcolor.withOpacity(0.25),
            ),
            SizedBox(height: w*0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text("\$205",style: TextStyle(
                      fontSize: w*0.055,
                      fontWeight: FontWeight.w700,
                      color: colorPage.primaryColor

                    ),),
                    Text("/night",style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: w*0.04
                    ),),
                    SizedBox(width: w*0.03,),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => selectedDate(),));
                  },
                  child: Container(
                    child: Center(
                      child: Text("Book Now!",
                        style: TextStyle(
                            fontSize: w*0.052,
                            fontWeight: FontWeight.w600,
                            color: colorPage.secondaryColor
                        ),),
                    ),
                    height: w*0.15,
                    width: w*0.65,
                    decoration: BoxDecoration(
                        color: colorPage.primaryColor,
                        borderRadius: BorderRadius.circular(w*0.1),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 3,
                              color: colorPage.blackcolor.withOpacity(0.15),
                              offset: Offset(0, 4)
                          )
                        ]
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
