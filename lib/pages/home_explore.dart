import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guidely/components/explore_cities_list_view.dart';

class ExploreScreen extends StatelessWidget {
  final Map cityData;

  const ExploreScreen(
    {
      super.key,
      required this.cityData
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  "Explore New Cities",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22
                  )
                ),
              ],
            ),
            ),
          Expanded(
            child: ExploreCitiesListView(data: cityData["cities"],)
            )
        ],
      ),
    );
  }
}