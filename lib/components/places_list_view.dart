import 'package:flutter/material.dart';
import "package:guidely/components/generic_display_card.dart";

class PlacesListView extends StatelessWidget {
  final List<dynamic> data;

  const PlacesListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      child: ListView.builder(
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: DisplayCard(
                title: data[index]["generic_tour_name"],
                imgUrl: data[index]["generic_tour_hero_img"],
                width: 143,
                height: 282,
                titleColor: Colors.white,
                alignTitleBottomLeft: false,
                itemId: data[index]["_id"],
                titleFontSize: 20,
                onTapAction: () {
                  Navigator.pushNamed(context, '/selectGuide', arguments: {
                    "genericTourData": data[index]
                  });
                },
              ),
            );
          }),
    );
  }
}
