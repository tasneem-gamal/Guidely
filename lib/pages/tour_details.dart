import 'package:flutter/material.dart';
import 'package:guidely/components/generic_app_bar.dart';
import 'package:guidely/components/guide_info_card.dart';
import 'package:guidely/components/guidely_generic_button.dart';
import 'package:guidely/utils/hex_color_conversion.dart';
import 'package:guidely/services/tour_info.dart';

class TourDetailsScreen extends StatefulWidget {
  const TourDetailsScreen({super.key});

  @override
  State<TourDetailsScreen> createState() => _TourDetailsScreenState();
}

class _TourDetailsScreenState extends State<TourDetailsScreen> {

  Map tourDetails = {};
  Map guideInfo = {};
  String tourId = '';

  bool updateCalled = false;

  void updateData() async {
    if (tourDetails.isEmpty && !updateCalled){
      updateCalled = true;
      dynamic taskResult = 
      await Navigator.pushNamed(context, '/loading', arguments: {
        'isStart': false,
        'loading_task': () async {
          var tourDetailsDat = await getTourById(tourId);
          return {"tour_details_data": tourDetailsDat};
        }
      });

      setState(() {
        tourDetails = taskResult["task_result"]["tour_details_data"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    guideInfo = arguments["guideInfo"];
    tourId = guideInfo["tour_id"];

    Future.delayed(Duration.zero, () async {
      updateData();
    });

    return Scaffold(
      appBar: GenericAppBar(title: "Details",),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GuideInfoCard(
                  name: guideInfo["guide_name"],
                  bio: guideInfo["guide_bio"],
                  experience: guideInfo["guide_experience"],
                  rating: guideInfo["guide_rating"],
                  location: guideInfo["guide_location"],
                  imgUrl: guideInfo["guide_profile_pic"],
                  age: guideInfo["guide_age"],
                  externalDisplay: false,
                  onTapAction: (){},
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Language',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  Text(
                    tourDetails.isEmpty ? "" : tourDetails["tour_language"],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  Text(
                    tourDetails.isEmpty ? "" : tourDetails["tour_date"],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tour time',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  Text(
                    tourDetails.isEmpty ? "" : tourDetails["tour_time"],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your data',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(
                      color: Color(hexColorToAARRGGBB("#067A5A")),
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  Text(
                    'Devid Wilson',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  Text(
                    '+8895858962',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  Text(
                    'test@gmail.com',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Text(
                    tourDetails.isEmpty ? "" : "\$${tourDetails["tour_price"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                    ),
                  ),
                ],
              ),
            ),],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GuidelyGenericButton(
                text: "Checkout",
                onTapAction: (){
                  Navigator.pushNamed(context, '/checkout');
                },
              ),
            )
          ],
        )
      ),
    );
  }
}