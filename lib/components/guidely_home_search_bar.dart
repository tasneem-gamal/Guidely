import 'package:flutter/material.dart';
import 'package:guidely/utils/hex_color_conversion.dart';

class GuidelyHomeSearchBar extends StatefulWidget {
  const GuidelyHomeSearchBar({super.key});

  @override
  State<GuidelyHomeSearchBar> createState() => _GuidelyHomeSearchBarState();
}

class _GuidelyHomeSearchBarState extends State<GuidelyHomeSearchBar> {
  String searchQuery = "";

  void onQueryChange(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: -8,
                        color: Color.fromARGB(255, 254, 255, 255).withOpacity(.6))
                  ]),
              padding: EdgeInsets.all(7),
              child: TextField(
                onChanged: onQueryChange,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(hexColorToAARRGGBB("#F6EEEE")),
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Discover New Places",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400
                      ),
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      size: 34,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
