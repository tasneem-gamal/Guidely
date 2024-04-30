import 'package:flutter/material.dart';
import 'package:guidely/components/explore_city_card.dart';

class ExploreCitiesListView extends StatelessWidget {

  final List<dynamic> data;

  const ExploreCitiesListView(
    {
      super.key,
      required this.data
    });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: ExploreCityCard(
                title: data[index]["city_name"],
                imgUrl: data[index]["city_hero_img"],
                rating: data[index]["city_rating"],
                bio: data[index]["city_bio"],
                onClickAction: () {
                  Navigator.pushNamed(context, '/cityDetails', arguments: {
                    'cityData': data[index]
                  });
                },
              ),
            );
        }
      );
  }
}