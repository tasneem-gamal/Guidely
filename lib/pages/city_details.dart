import 'package:flutter/material.dart';
import 'package:guidely/components/generic_app_bar.dart';
import 'package:guidely/components/rating_stars_list.dart';
import 'package:guidely/components/guidely_generic_button.dart';

class CityDetailsScreen extends StatelessWidget {
  const CityDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    Map cityData = arguments["cityData"];

    return Scaffold(
        appBar: GenericAppBar(
          title: "",
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 282,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(cityData["city_hero_img"]),
                        )),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(6, 6, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cityData["city_name"],
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Cairo"),
                          ),
                          Text(cityData["city_bio"],
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          RatingStarsList(
                              numberOfStars: cityData["city_rating"].round()),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text("Description",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Cairo")),
                          ),
                          Text(cityData["city_description"],
                              style:
                                  TextStyle(fontSize: 16, fontFamily: "Cairo")),
                        ],
                      ))
                ],
              ),
              Align(
                child: GuidelyGenericButton(
                  text: "Explore",
                  onTapAction: () {
                    Navigator.pushNamed(context, '/cityTours',
                        arguments: {"cityId": cityData["_id"]});
                  },
                ),
                alignment: Alignment.bottomCenter,
              )
            ],
          ),
        ));
  }
}
