import 'package:flutter/material.dart';
import 'package:guidely/utils/hex_color_conversion.dart';

class TourInfoCard extends StatelessWidget {
  
  final String imgUrl;
  final String caption;
  final int price;
  final int duration;
  final double rating;

  const TourInfoCard(
    {
      super.key,
      required this.imgUrl,
      required this.caption,
      required this.price,
      required this.duration,
      required this.rating
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 133,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: NetworkImage(
                imgUrl,
                ),
                fit: BoxFit.cover,
              ),),),
              SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      caption,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                      ),
                    ),
                  ),
                  Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        color: Color(hexColorToAARRGGBB("#D9D9D9")),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$price\$',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          )
                          ]
                        )
                      )
                  ],),
                )
                ],
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        width: 197,
                        height: 68,
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color: Color(hexColorToAARRGGBB("#D9D9D9")),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Duration',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '$duration days',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800
                                ),
                              )
                            ],
                          ),
                        )
                        ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    flex: 1,
                    child: Container(
                        width: 197,
                        height: 68,
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color: Color(hexColorToAARRGGBB("#D9D9D9")),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rating',
                              style: TextStyle(
                                    fontSize: 16,
                                  ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star, size: 18, color: Colors.yellow,),
                                SizedBox(width: 3,),
                                Text(
                              rating.toString(),
                              style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                            )],
                            ),
                            ]
                          ),
                        )
                        ),
                  ),
                ],
              ),
      ],
    );
  }
}