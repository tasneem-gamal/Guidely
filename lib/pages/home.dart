import 'package:flutter/material.dart';
import 'package:guidely/components/guidely_app_bar.dart';
import 'package:guidely/pages/home_explore.dart';
import 'package:guidely/pages/home_main.dart';
import 'package:guidely/pages/home_settings.dart';
import 'package:guidely/services/city_info.dart';
import 'package:guidely/services/tour_info.dart';
import 'package:guidely/services/remote_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map cityData = {"cities": []};
  Map genericTourData = {"generic_tours": []};

  bool updateCalled = false;

  int _currentPageIdx = 0;

  List<Widget> pages = [];

  void updateData() async {
    if (cityData["cities"].length == 0 &&
        genericTourData["generic_tours"].length == 0 &&
        !updateCalled) {
      updateCalled = true;
      dynamic taskResult =
          await Navigator.pushNamed(context, '/loading', arguments: {
        'isStart': true,
        'loading_task': () async {

          var citiesDat = await getAllCities();
          var genericToursDat = await getAllGenericTours();
          
          for (var i = 0; i < citiesDat["cities"].length; i++){
            String imgName = citiesDat["cities"][i]["city_hero_img"];
            String imgUrl  = await getImageUrl(imgName);
            citiesDat["cities"][i]["city_hero_img"] = imgUrl;
          }

          for (var i = 0; i < genericToursDat["generic_tours"].length; i++){
            String imgName = genericToursDat["generic_tours"][i]["generic_tour_hero_img"];
            String imgUrl  = await getImageUrl(imgName);
            genericToursDat["generic_tours"][i]["generic_tour_hero_img"] = imgUrl;
          }
          
          return {"cities_data": citiesDat, "generic_tours_data": genericToursDat};
        }
      });

      setState(() {
        cityData = taskResult["task_result"]["cities_data"];
        genericTourData = taskResult["task_result"]["generic_tours_data"];
      });

      pages.add(HomeMainScreen(cityData: cityData, genericTourData: genericTourData));
      pages.add(ExploreScreen(
        cityData: cityData,
      ));
      pages.add(SettingsScreen());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      updateData();
    });

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: GuidelyAppBar(),
        bottomNavigationBar: NavigationBar(
            height: 65,
            selectedIndex: _currentPageIdx,
            onDestinationSelected: (int index) {
              setState(() {
                _currentPageIdx = index;
              });
            },
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            destinations: [
              NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home'),
              NavigationDestination(
                  selectedIcon: Icon(Icons.explore),
                  icon: Icon(Icons.explore_outlined),
                  label: 'Explore'),
              NavigationDestination(
                  selectedIcon: Icon(Icons.settings),
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings')
            ]),
        body: (pages.isEmpty
            ? Container(child: Column())
            : pages[_currentPageIdx]));
  }
}
