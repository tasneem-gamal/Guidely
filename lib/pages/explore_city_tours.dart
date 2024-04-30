import 'package:flutter/material.dart';
import 'package:guidely/components/generic_app_bar.dart';
import 'package:guidely/components/generic_display_card.dart';
import 'package:guidely/services/city_info.dart';
import 'package:guidely/services/remote_storage.dart';

class ExploreCityToursScreen extends StatefulWidget {
  const ExploreCityToursScreen({super.key});

  @override
  State<ExploreCityToursScreen> createState() => _ExploreCityToursScreenState();
}

class _ExploreCityToursScreenState extends State<ExploreCityToursScreen> {
  Map genericToursData = {"generic_tours": []};
  bool updateCalled = false;
  String cityId = '';

  void updateData() async {
    if (genericToursData["generic_tours"].length == 0 && !updateCalled) {
      updateCalled = true;
      dynamic taskResult =
          await Navigator.pushNamed(context, '/loading', arguments: {
        'isStart': false,
        'loading_task': () async {
          var genericToursDat = await getCityGenericTours(cityId);
          for (var i = 0; i < genericToursDat["generic_tours"].length; i++){
            String imgName = genericToursDat["generic_tours"][i]["generic_tour_hero_img"];
            String imgUrl  = await getImageUrl(imgName);
            genericToursDat["generic_tours"][i]["generic_tour_hero_img"] = imgUrl;
          }
          return {"generic_tours_data": genericToursDat};
        }
      });

      setState(() {
        genericToursData = taskResult["task_result"]["generic_tours_data"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    cityId = arguments["cityId"];

    Future.delayed(Duration.zero, () async {
      updateData();
    });

    List GenericTours = genericToursData["generic_tours"];

    return Scaffold(
      appBar: GenericAppBar(
        title: 'Tours',
      ),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Places",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: (GenericTours.length / 2).round(),
                        itemBuilder: (context, index) {
                          int x = index * 2;
                          return Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    child: DisplayCard(
                                        title: GenericTours[x]["generic_tour_name"],
                                        imgUrl: GenericTours[x]["generic_tour_hero_img"],
                                        height: 145,
                                        width: double.infinity,
                                        titleFontSize: 18,
                                        titleColor: Colors.white,
                                        itemId: GenericTours[x]["_id"],
                                        alignTitleBottomLeft: true,
                                        onTapAction: () {
                                          Navigator.pushNamed(context, '/selectGuide', arguments: {
                                            "genericTourData": GenericTours[x]
                                          });
                                        }),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: (x + 1) >= GenericTours.length
                                      ? Container()
                                      : Container(
                                          margin: EdgeInsets.all(4),
                                          child: DisplayCard(
                                              title: GenericTours[x + 1]["generic_tour_name"],
                                              imgUrl: GenericTours[x + 1]["generic_tour_hero_img"],
                                              height: 145,
                                              width: double.infinity,
                                              titleFontSize: 18,
                                              titleColor: Colors.white,
                                              itemId: GenericTours[x + 1]["_id"],
                                              alignTitleBottomLeft: true,
                                              onTapAction: () {
                                                Navigator.pushNamed(context, '/selectGuide', arguments: {
                                                  "genericTourData": GenericTours[x + 1]
                                                });
                                              }),
                                        ))
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
