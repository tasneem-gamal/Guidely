import 'package:flutter/material.dart';

class GuideInfoCard extends StatelessWidget {

  final String name;
  final String bio;
  final String location;
  final String imgUrl;
  final int age;
  final int experience;
  final double rating;
  final bool externalDisplay;

  final Function onTapAction;

  const GuideInfoCard(
    {
      super.key,
      required this.name,
      required this.bio,
      required this.location,
      required this.imgUrl,
      required this.age,
      required this.experience,
      required this.rating,
      required this.externalDisplay,
      required this.onTapAction
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTapAction();},
      child: Container(
        width: double.infinity,
        height: 130,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  width: 117,
                  height: 119,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      image: NetworkImage(
                        imgUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ),
              SizedBox(width: 8,),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      bio,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 8,),
                    externalDisplay ? 
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                      'Experience',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    Text(
                      '$experience Years',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                          ],
                        ),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                      'Rating',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                          ],
                        ),
                      ],
                    ) : 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      SizedBox(height: 5,),
                      Text(
                      '$age Age',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal
                      ),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(
                          Icons.location_city  //location
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '$location',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    )
                    ],)
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}