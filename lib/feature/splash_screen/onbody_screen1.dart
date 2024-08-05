import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/main.dart';

import 'loading_page.dart';
import 'onbody_content.dart';

class onbodyScreen1 extends StatefulWidget {
  const onbodyScreen1({super.key});

  @override
  State<onbodyScreen1> createState() => _onbodyScreen1State();
}

class _onbodyScreen1State extends State<onbodyScreen1> {
  int currentindex=0;
  PageController controller=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: h*1,
              width: w*1,
              child: PageView.builder(
                  controller: controller,
                padEnds: false,
                itemCount: content.length,
                onPageChanged: (int index){
                    setState(() {
                     currentindex=index;
                    });
                },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: w*1.45,
                          width: w*1,
                          color: colorPage.thirdcolor,
                          child: Stack(
                            children:[ Container(
                              height: w*1,
                              width: w*1,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(content[index].images))
                              ),

                            ),
                              Positioned(
                                // top: width*0.7,
                                bottom: w*0.06,
                                left: w*0.055,
                                child: Text(content[index].title,
                                  style: TextStyle(
                                    color: colorPage.blackcolor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: w*0.14
                                  ),),
                              ),
                ]
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: w*0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(content[index].description,
                          style: TextStyle(
                            color: colorPage.fourthcolor,
                            fontWeight: FontWeight.w400,
                            fontSize: w*0.045
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                              List.generate(
                                  3, (index) => Container(
                                        height: w*0.02,
                                        width: currentindex==index?w*0.07:w*0.04,
                                margin: EdgeInsets.only(right: w*0.04),
                                decoration: BoxDecoration(
                                  borderRadius:
                                    BorderRadius.circular(w*0.03),
                                  color: currentindex==index?colorPage.primaryColor:colorPage.sixthcolor
                                ),
                                      ))
                          ),
                          InkWell(
                            onTap: () {
                              if(currentindex==2){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => loadingPage(),));
                              }else{
                                controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                              }
                            },
                            child: Container(
                              height: w*0.13,
                              width: w*0.8,
                              child: Center(
                                child: Text(currentindex==2?"Done":"Next",style: TextStyle(
                                  fontSize: w*0.05,
                                  color: colorPage.thirdcolor,
                                  fontWeight: FontWeight.w600,
                                ),),
                              ),
                              decoration: BoxDecoration(
                                color: colorPage.primaryColor,
                                borderRadius: BorderRadius.circular(w*0.1)
                              ),
                            ),
                          ),
                          currentindex==2?SizedBox():
                              InkWell(
                                onTap: () {
                                  controller.jumpToPage(2);
                                },
                                child: Container(
                                  height: w*0.13,
                                  width: w*0.8,
                                  child: Center(
                                    child: Text(
                                      "Skip",style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: w*0.05,
                                      color: colorPage.primaryColor
                                    ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: colorPage.sixthcolor,
                                    borderRadius: BorderRadius.circular(w*0.1)
                                  ),
                                ),
                              ),
                        ],
                      ),
                    )
                  ],
                );
              },
              ),
            )
          ],
        ),
      ),
    );
  }
}
