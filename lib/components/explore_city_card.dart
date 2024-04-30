import 'package:flutter/material.dart';
import 'package:guidely/utils/hex_color_conversion.dart';

class ExploreCityCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String bio;
  final double rating;
  final Function onClickAction;

  const ExploreCityCard(
    {
      super.key,
      required this.imgUrl,
      required this.title,
      required this.bio,
      required this.rating,
      required this.onClickAction
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Container(
        margin: EdgeInsets.all(2),
        width: double.infinity,
        height: 148,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.all(10),
            child: FloatingActionButton.small(
              heroTag: 'hr_$title',
              onPressed: () {onClickAction();},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              backgroundColor: Color(hexColorToAARRGGBB("#00A97A")) ,
              child: Icon(
                size: 20,
                Icons.call_made,
                color: Colors.black,
                ),
            ),
          ),
        )
      ),
      Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  Text(
                    bio,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                    )
                ]),
            ),
        
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        color: Color(hexColorToAARRGGBB("#D9D9D9")),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.star, size: 18, color: Colors.amber,),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                            child: Text(
                              rating.toString(), 
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500
                                ),
                              ),
                          )
                          ]
                        )
                      )
                  ],)],
                ),
              )
          ]
            ),
      )
        ],
      );
  }
}