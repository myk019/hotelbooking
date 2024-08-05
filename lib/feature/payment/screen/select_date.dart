import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/feature/profile/screen/edit_profile.dart';
import 'package:hotelbooking/feature/payment/screen/name_of_reservation.dart';

import '../../../core/image_page.dart';
import '../../../main.dart';

class selectedDate extends StatefulWidget {
  const selectedDate({super.key});

  @override
  State<selectedDate> createState() => _selectedDateState();
}
class _selectedDateState extends State<selectedDate> {
  List<DateTime?> date=[];
  int count=1;
  int difference=0;
  @override
  Widget build(BuildContext context) {
    difference=date.isEmpty?0:date.last!.difference(date.first!).inDays;
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
        title: Text("Select Date",
          style: TextStyle(
              color: colorPage.blackcolor,
              fontWeight: FontWeight.w700,
              fontSize: w*0.07
          ),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: h*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(w*0.03),
                height: w*0.8,
                width: w*1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.02),
                  color: colorPage.sixthcolor
                ),
                child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.range,
                  // centerAlignModePicker: true
                  selectedDayHighlightColor: colorPage.primaryColor,
                  currentDate: DateTime(DateTime.november),
                ),
                value: date,
                onValueChanged: (value) {
                  date=value;
                  setState(() {

                  });
                },
    ),
              ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("Check in",style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: w*0.05,
                              ),),
                              SizedBox(height: w*0.02,),
                      Container(
                        height: w*0.12,
                        width: w*0.4,
                        decoration: BoxDecoration(
                          color: colorPage.lightgreycolor,
                          borderRadius: BorderRadius.circular(w*0.03),
                        ),child:
                        Padding(
                          padding: EdgeInsets.all(w*0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(date.isEmpty?"":date[0].toString().substring(0,10)),
                              SvgPicture.asset(imagePage.dateandbirthIcon)
                            ],
                          ),
                        ),
                )
                      ],),
                      Column(
                        children: [
                          SvgPicture.asset(imagePage.arrowrightIcon),
                          SizedBox(height: w*0.03,)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("Check out",style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: w*0.05,
                              ),),
                              SizedBox(height: w*0.02,),
                      Container(
                        height: w*0.12,
                        width: w*0.4,
                        decoration: BoxDecoration(
                          color: colorPage.lightgreycolor,
                          borderRadius: BorderRadius.circular(w*0.03),
                        ),child:
                        Padding(
                          padding: EdgeInsets.all(w*0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(date.length==1 ||date.isEmpty?"":date[1].toString().substring(0,10)),
                              SvgPicture.asset(imagePage.dateandbirthIcon)
                            ],
                          ),
                        ),
                         )
                      ],),
                    ],
                  ),
            ],
          ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Container(
                     margin: EdgeInsets.all(w*0.03),
                     child: Text("Guest",style: TextStyle(
                        fontSize: w*0.055,
                        fontWeight: FontWeight.w700
                      ),),
                   ),
                  Container(
                    margin: EdgeInsets.all(w*0.04),
                    height: w*0.15,
                    width: w*1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.02),
                      border: Border.all(
                          color:colorPage.greycolor3 )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            count++;
                            setState(() {

                            });

                          },
                          child: Container(
                            height: w*0.1,
                            width: w*0.1,
                            decoration: BoxDecoration(
                              color: colorPage.sixthcolor,
                              borderRadius: BorderRadius.circular(w*0.02)
                            ),
                            child: Center(
                              child: Text("+",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: w*0.05
                              ),),
                            ),
                          ),
                        ),
                        Text(count.toString(),
                          style: TextStyle(
                              fontSize: w*0.06
                          ),),
                        InkWell(
                          onTap: () {
                            count<=1?0:count--;
                            setState(() {
                            });
                          },
                          child: Container(
                            height: w*0.1,
                            width: w*0.1,
                            decoration: BoxDecoration(
                                color: colorPage.sixthcolor,
                                borderRadius: BorderRadius.circular(w*0.02)
                            ),
                            child: Center(
                              child: Text("-",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: w*0.05
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Text("Total: \$${(count*175)*(difference)}",style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: w*0.055
                    ),),
                  ),
                  SizedBox(height: w*0.04,),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if(date.isEmpty||date.length==1){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please mention date")));
                        }else{
                          Navigator.push(context, MaterialPageRoute(builder: (context) => nameofReservation(),));
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
