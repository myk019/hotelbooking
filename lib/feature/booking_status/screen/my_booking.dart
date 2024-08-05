import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/home/cancel_hotel_booking.dart';
import 'package:hotelbooking/feature/payment/screen/payment_page.dart';
import 'package:hotelbooking/home/search_page.dart';
import 'package:hotelbooking/payment_status/screen/ticket_page.dart';
import 'package:hotelbooking/image_page.dart';

import '../../../main.dart';

class myBooking extends StatefulWidget {
  const myBooking({super.key});

  @override
  State<myBooking> createState() => _myBookingState();
}

class _myBookingState extends State<myBooking> {
  List category=["Ongoing","Completed","Canceled"];
  int selectIndex=0;
  List tabbar=[
    {
      "image":imagePage.image1,
      "name":"Intercontinental Hotel",
    },
    {
      "image":imagePage.image3,
      "name":"Nevada Hotel",
    },
    {
      "image":imagePage.image5,
      "name":"Oriental Hotel",
    },
    {
      "image":imagePage.image5,
      "name":"Oriental Hotel",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
        title: Text("My Booking",
          style: TextStyle(
              fontSize: w*0.08,
              fontWeight: FontWeight.w700,
              color: colorPage.blackcolor
          ),),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => searchPage(),));
              },
              child: SvgPicture.asset(imagePage.searchIcon2)),
          SizedBox(width: w*0.05,)
        ],
      ),
        backgroundColor: colorPage.sixthcolor,
        body: Padding(
          padding:  EdgeInsets.all(w*0.02),
          child: Column(
            children: [
              Container(
                height: w*0.15,
                width: w*1,
                // margin: EdgeInsets.all(w*0.02),
                decoration: BoxDecoration(
                  color: colorPage.secondaryColor,
                ),
                child: TabBar(
                  padding: EdgeInsets.all(w*0.025),
                  labelColor: colorPage.secondaryColor,
                  unselectedLabelColor: colorPage.blackcolor,
                  indicator: BoxDecoration(
                    color:colorPage.primaryColor,
                    borderRadius: BorderRadius.circular(w*0.04)
                  ),
                  tabs: [
                    Tab(
                      text: "Ongoing",
                    ),
                    Tab(
                      text: "Completed",
                    ),
                    Tab(
                      text: "Canceled",
                    ),
                  ],
                ),
              ),
              SizedBox(height: w*0.03,),
              Expanded(
                  child: TabBarView(
                    children: [
                    Container(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              height: w*0.6,
                              width:w*1,
                              decoration: BoxDecoration(
                                  color: colorPage.secondaryColor,
                                borderRadius: BorderRadius.circular(w*0.03)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w*0.04,right: w*0.04,top: w*0.05,bottom: w*0.03),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height:w*0.3,
                                          width: w*0.28,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage(tabbar[index]["image"]),fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(w*0.04)
                                          ),
                                        ),
                                        SizedBox(width: w*0.03,),
                                        Container(
                                          height: w*0.3,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(tabbar[index]["name"],style: TextStyle(
                                                fontSize: w*0.06,
                                                fontWeight: FontWeight.w700
                                              ),),
                                              Text("Lagos, Nigeria",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: w*0.04
                                              ),),
                                              Container(
                                                height: w*0.06,
                                                width: w*0.18,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(w*0.02),
                                                  color: colorPage.sixthcolor
                                                ),
                                                child: Center(
                                                  child: Text("Paid",style: TextStyle(
                                                    color: colorPage.primaryColor,
                                                    fontSize: w*0.04
                                                  ),),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      indent: w*0.02,
                                      endIndent: w*0.02,
                                      height: w*0.04,
                                      thickness: w*0.002,
                                      color: colorPage.blackcolor.withOpacity(0.25),
                                    ),
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                              showDragHandle: true,
                                              backgroundColor: colorPage.secondaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(w*0.1),
                                                    topLeft: Radius.circular(w*0.1)
                                                  )
                                                ),
                                                context: context,
                                                builder: (context) {
                                                  return Container(
                                                    margin: EdgeInsets.all(w*0.03),
                                                    height: w*0.66,
                                                    width: w*1,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Text("Cancel Booking",style: TextStyle(
                                                          fontSize: w*0.07,
                                                          fontWeight: FontWeight.w700,
                                                          color: colorPage.redcolor2
                                                        ),),
                                                        Divider(
                                                          indent: w*0.02,
                                                          endIndent: w*0.02,
                                                          height: w*0.04,
                                                          thickness: w*0.002,
                                                          color: colorPage.blackcolor.withOpacity(0.25),
                                                        ),
                                                        Text("Are you sure you want to cancel your hotel bookings?",textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: w*0.065,
                                                            color: colorPage.blackcolor2
                                                        ),),
                                                        Text("Only 80% of the money you can refund from your payment according to our policy",textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: w*0.04,
                                                          fontWeight: FontWeight.w400,
                                                          color: colorPage.blackcolor2
                                                        ),),
                                                        SizedBox(height: w*0.01,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            Center(
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(context);
                                                                },
                                                                child: Container(
                                                                  child: Center(
                                                                    child: Text("Cancel",
                                                                      style: TextStyle(
                                                                          fontSize: w*0.04,
                                                                          fontWeight: FontWeight.w600,
                                                                          color: colorPage.primaryColor
                                                                      ),),
                                                                  ),
                                                                  height: w*0.13,
                                                                  width: w*0.45,
                                                                  decoration: BoxDecoration(
                                                                      color: colorPage.sixthcolor,
                                                                      borderRadius: BorderRadius.circular(w*0.1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Center(
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => cancelHotelBooking(),));
                                                                },
                                                                child: Container(
                                                                  child: Center(
                                                                    child: Text("Yes, Continue",
                                                                      style: TextStyle(
                                                                          fontSize: w*0.04,
                                                                          fontWeight: FontWeight.w600,
                                                                          color: colorPage.secondaryColor
                                                                      ),),
                                                                  ),
                                                                  height: w*0.13,
                                                                  width: w*0.45,
                                                                  decoration: BoxDecoration(
                                                                      color: colorPage.primaryColor,
                                                                      borderRadius: BorderRadius.circular(w*0.1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )

                                                      ],
                                                    ),
                                                  );

                                                },);
                                          },
                                          child: Container(
                                            height: w*0.1,
                                            width: w*0.4,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(w*0.05),
                                              color: colorPage.secondaryColor,
                                              border: Border.all(
                                                color: colorPage.primaryColor,
                                                width:w*0.003,
                                              )
                                            ),
                                            child: Center(child: Text("Cancel Booking",style:
                                              TextStyle(
                                                fontSize: w*0.05,
                                                fontWeight: FontWeight.w600,
                                                color: colorPage.primaryColor
                                              ),)),
                                          ),
                                        ),
                                        Container(
                                          height: w*0.1,
                                          width: w*0.4,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(w*0.05),
                                            color: colorPage.primaryColor
                                          ),
                                          child: Center(child: InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => ticketPage(),));
                                            },
                                            child: Text("View Ticket",style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: w*0.05,
                                              color: colorPage.secondaryColor
                                            ),),
                                          )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: w*0.02,);
                          },
                          itemCount: tabbar.length),
                    ),
                    Container(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              height: w*0.6,
                              width:w*1,
                              color: colorPage.secondaryColor,
                              child: Padding(
                                padding: EdgeInsets.only(left: w*0.04,right: w*0.04,top: w*0.05,bottom: w*0.03),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.only(left: w*0.04,right: w*0.04,top: w*0.05,bottom: w*0.03),
                                          height:w*0.3,
                                          width: w*0.28,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage(tabbar[index]["image"]),fit: BoxFit.fill),
                                            borderRadius: BorderRadius.circular(w*0.04)
                                          ),
                                        ),
                                        SizedBox(width: w*0.03,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(tabbar[index]["name"],style: TextStyle(
                                              fontSize: w*0.06,
                                              fontWeight: FontWeight.w700
                                            ),),
                                            SizedBox(height: w*0.02,),
                                            Text("Lagos, Nigeria",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: w*0.04
                                            ),),
                                            SizedBox(height: w*0.03,),
                                            Container(
                                              height: w*0.065,
                                              width: w*0.2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(w*0.02),
                                                color: colorPage.sixthcolor
                                              ),
                                              child: Center(
                                                child: Text("Completed",style: TextStyle(
                                                  color: colorPage.primaryColor
                                                ),),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: w*0.03,),
                                    Divider(
                                      indent: w*0.02,
                                      endIndent: w*0.02,
                                      height: w*0.04,
                                      thickness: w*0.002,
                                      color: colorPage.blackcolor.withOpacity(0.25),
                                    ),
                                    SizedBox(height: w*0.03,),
                                    Container(
                                      height: w*0.09,
                                      width: w*0.85,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(w*0.02),
                                        color: colorPage.sixthcolor
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: w*0.03,),
                                          SvgPicture.asset(imagePage.tickIcon),
                                          SizedBox(width: w*0.01,),
                                          Text("yay. you have completed it!",style: TextStyle(
                                            color: colorPage.primaryColor
                                          ),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: w*0.02,);
                          },
                          itemCount: tabbar.length),
                    ),
                    Container(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              height: w*0.6,
                              width:w*1,
                              color: colorPage.secondaryColor,
                              child: Padding(
                                padding: EdgeInsets.only(left: w*0.04,right: w*0.04,top: w*0.05,bottom: w*0.03),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.only(left: w*0.04,right: w*0.04,top: w*0.05,bottom: w*0.03),
                                          height:w*0.3,
                                          width: w*0.28,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage(tabbar[index]["image"]),fit: BoxFit.fill),
                                            borderRadius: BorderRadius.circular(w*0.04)
                                          ),
                                        ),
                                        SizedBox(width: w*0.03,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(tabbar[index]["name"],style: TextStyle(
                                              fontSize: w*0.06,
                                              fontWeight: FontWeight.w700
                                            ),),
                                            SizedBox(height: w*0.02,),
                                            Text("Lagos, Nigeria",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: w*0.04
                                            ),),
                                            SizedBox(height: w*0.03,),
                                            Container(
                                              height: w*0.06,
                                              width: w*0.33,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(w*0.02),
                                                color: colorPage.redcolor3
                                              ),
                                              child: Center(
                                                child: Text("Canceled & Refunded",style: TextStyle(
                                                  color: colorPage.redcolor,
                                                  fontSize: w*0.036
                                                ),),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: w*0.03,),
                                    Divider(
                                      indent: w*0.02,
                                      endIndent: w*0.02,
                                      height: w*0.04,
                                      thickness: w*0.002,
                                      color: colorPage.blackcolor.withOpacity(0.25),
                                    ),
                                    SizedBox(height: w*0.03,),
                                    Container(
                                      height: w*0.09,
                                      width: w*0.85,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(w*0.02),
                                          color: colorPage.redcolor3
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: w*0.03,),
                                          SvgPicture.asset(imagePage.iIcon),
                                          SizedBox(width: w*0.01,),
                                          Text("You canceled this hotel booking",style: TextStyle(
                                              color: colorPage.redcolor
                                          ),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: w*0.02,);
                          },
                          itemCount: tabbar.length),
                    ),

                  ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
