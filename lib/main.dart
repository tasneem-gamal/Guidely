import 'package:flutter/material.dart';
import 'package:guidely/pages/checkout.dart';
import 'package:guidely/pages/explore_city_tours.dart';
import 'package:guidely/pages/home.dart';
import 'package:guidely/pages/loading.dart';
import 'package:guidely/pages/city_details.dart';
import 'package:guidely/pages/select_guide.dart';
import 'package:guidely/pages/tour_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: '/home',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: "Cairo"),
    routes: {
      '/home': (context) => const HomeScreen(),
      '/loading': (context) => LoadingScreen(),
      '/cityDetails': (context) => CityDetailsScreen(),
      '/tourDetails': (context) => TourDetailsScreen(),
      '/selectGuide': (context) => SelectGuideScreen(),
      '/cityTours': (context) => ExploreCityToursScreen(),
      '/checkout': (context) => CheckoutScreen()
    },
  ));
}
