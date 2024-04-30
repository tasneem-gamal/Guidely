import 'package:flutter/material.dart';
import 'package:guidely/components/guidely_home_search_bar.dart';
import 'package:guidely/components/places_list_view.dart';
import 'package:guidely/components/recommendations_list_view.dart';

class HomeMainScreen extends StatelessWidget {
  final Map cityData;
  final Map genericTourData;

  const HomeMainScreen(
    {
      super.key,
      required this.cityData,
      required this.genericTourData
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GuidelyHomeSearchBar(),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 25, 0, 4),
                  child: Row(
                    children: [
                      Text(
                        "Recommended for you",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ),
                        )
                      ],
                    )
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RecommendationsListView(data: cityData["cities"])),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 20, 0, 4),
                  child: Row(
                    children: [
                      Text(
                        "Places",
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ),
                        )
                      ],
                    )
                  ),
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PlacesListView(data: genericTourData["generic_tours"])),
              ]),
          ));
  }
}