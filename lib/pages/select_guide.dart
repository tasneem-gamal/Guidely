import 'package:flutter/material.dart';
import 'package:guidely/components/generic_app_bar.dart';
import 'package:guidely/components/guide_info_card.dart';
import 'package:guidely/components/tour_info_card.dart';
import 'package:guidely/services/tour_info.dart';
import 'package:guidely/services/remote_storage.dart';

class SelectGuideScreen extends StatefulWidget {
  const SelectGuideScreen({super.key});

  @override
  State<SelectGuideScreen> createState() => _SelectGuideScreenState();
}

class _SelectGuideScreenState extends State<SelectGuideScreen> {

  Map genericTourData = {};
  Map guidesData = {"guides": []};
  String genericTourId = '';

  bool updateCalled = false;

  void updateData() async {
    if (guidesData["guides"].length == 0 && !updateCalled){
      updateCalled = true;
      dynamic taskResult = 
      await Navigator.pushNamed(context, '/loading', arguments: {
        'isStart': false,
        'loading_task': () async {
          var guidesDat = await getGenericTourGuides(genericTourId);

          for (var i = 0; i < guidesDat["guides"].length; i++){
            String imgName = guidesDat["guides"][i]["guide_profile_pic"];
            String imgUrl  = await getImageUrl(imgName);
            guidesDat["guides"][i]["guide_profile_pic"] = imgUrl;
          }

          return {"guides_data": guidesDat};
        }
      });

      setState(() {
        guidesData = taskResult["task_result"]["guides_data"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    genericTourData = arguments["genericTourData"];
    genericTourId = genericTourData["_id"];

    Future.delayed(Duration.zero, () async {
      updateData();
    });

    List guides = guidesData["guides"];

    return Scaffold(
      appBar: GenericAppBar(title: "Select Guide",),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TourInfoCard(
                imgUrl: genericTourData["generic_tour_hero_img"], 
                caption: genericTourData["generic_tour_description"], 
                price: genericTourData["generic_tour_price"], 
                duration: genericTourData["generic_tour_duration"], 
                rating: genericTourData["generic_tour_rating"]
                ),
              SizedBox(height: 10,),
              Text(
                "Tour Guides",
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => GuideInfoCard(
                  name: guides[index]["guide_name"],
                  bio: guides[index]["guide_bio"],
                  experience: guides[index]["guide_experience"],
                  rating: guides[index]["guide_rating"],
                  location: guides[index]["guide_location"],
                  imgUrl: guides[index]["guide_profile_pic"],
                  age: guides[index]["guide_age"],
                  externalDisplay: true,
                  onTapAction: (){
                    Navigator.pushNamed(context, '/tourDetails',
                    arguments: {"guideInfo": guides[index]});
                  },
                ),
                separatorBuilder: (context, index) => SizedBox(height: 0.0),
                itemCount: guides.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}