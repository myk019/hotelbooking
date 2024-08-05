import 'package:flutter/material.dart';
import 'package:hotelbooking/core/colour_page.dart';
import 'package:hotelbooking/feature/profile/screen/kezia_profile.dart';
import 'package:hotelbooking/home/search_page.dart';

import '../../booking_status/screen/my_booking.dart';
import 'home_page.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({super.key});

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int selectIndex=0;
  List pages=[
    homePage(),
    searchPage(),
    myBooking(),
    keziaProfile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: selectIndex,
        onTap: (value) {
          selectIndex=value;
          setState(() {
          });
        },
        selectedItemColor: colorPage.primaryColor,
        unselectedItemColor: colorPage.blackcolor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: "Search"

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: "Booking"

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"

          )
        ],
      ),
    );
  }
}
