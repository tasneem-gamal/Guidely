import 'package:flutter/material.dart';
import 'package:guidely/components/generic_app_bar.dart';
import 'package:guidely/components/guidely_generic_button.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  int adult = 1;
  int child = 1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: GenericAppBar(title: "Checkout"),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              "Passengers",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400
                ),
              ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adult',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        '15 - 50 years',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ]
                  ),
                  Row(
                    children: [
                      FloatingActionButton(
                        onPressed: (){
                          setState(() {
                            if (adult == 0){
                              return;
                            }
                            adult--;
                          });
                        },
                        elevation: 2,
                        backgroundColor: Colors.white,
                        heroTag: "btn1",
                        mini: true,
                        child: Icon(Icons.remove, color: Colors.black,),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        '$adult',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(width: 10,),
                      FloatingActionButton(
                        onPressed: (){
                          setState(() {
                            adult++;
                            print("$adult");
                          });
                        },
                        elevation: 2,
                        backgroundColor: Colors.white,
                        heroTag: "btn2",
                        mini: true,
                        child: Icon(Icons.add, color: Colors.black,),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Child',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        '7 - 15 years',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FloatingActionButton(
                        onPressed: (){
                            setState(() {
                              if (child == 0){
                                return;
                              }
                              child--;
                          });
                        },
                        elevation: 2,
                        backgroundColor: Colors.white,
                        heroTag: "btn3",
                        mini: true,
                        child: Icon(Icons.remove, color: Colors.black,),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        '$child',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(width: 10,),
                      FloatingActionButton(
                        onPressed: (){
                          setState(() {
                            child++;
                          });
                        },
                        elevation: 2,
                        backgroundColor: Colors.white,
                        heroTag: "btn4",
                        mini: true,
                        child: Icon(Icons.add, color: Colors.black,),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            SizedBox(height: 20,),
            Text(
              "Important information",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Please reach Via Germanico, 8 to redeem your ticket. Arrive 25 minutes before the starting time. The ticket is valid only for the reserved time. Latecomers will not be guaranteed an entrance ticket. Once you're in the Museum you can explore until the closing time of the vatican Museums.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  image: NetworkImage(
                    "http://10.0.2.2:8000/static/map.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),],
            ),
            Align(
              alignment: Alignment.bottomCenter ,
              child: GuidelyGenericButton(text: "Checkout", onTapAction: (){},),
            )
          ],
        ),
      ),
    );
  }
}