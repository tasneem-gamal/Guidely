import 'package:flutter/material.dart';
import 'package:guidely/components/generic_display_card.dart';

class RecommendationsListView extends StatelessWidget {
  final List<dynamic> data;

  const RecommendationsListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: DisplayCard(
                title: data[index]["city_name"],
                imgUrl: data[index]
                    ["city_hero_img"],
                width: 233,
                height: 157,
                titleColor: Colors.white,
                titleFontSize: 20,
                itemId: data[index]["_id"],
                alignTitleBottomLeft: true,
                onTapAction: () {
                  Navigator.pushNamed(context, '/cityDetails',
                      arguments: {'cityData': data[index]});
                },
              ),
            );
          }),
    );
  }
}
