import 'package:flutter/material.dart';

import '../main.dart';


class testPage extends StatelessWidget {
  const testPage({super.key});



  @override
  Widget build(BuildContext context) {
    int count=0;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                count++;
                print(count);
              },
              child: Container(
                height: w*0.1,
                width: w*0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.08),
                  color: Colors.red
                ),
                child: Icon(Icons.add),
              ),
            ),
            SizedBox(height: w*0.02,),
            Text(count.toString()),
            SizedBox(height: w*0.02,),
            InkWell(
              onTap: () {
                count--;
              },
              child: Container(
                height: w*0.1,
                width: w*0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.08),
                  color: Colors.red
                ),
                child: Icon(Icons.remove),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
