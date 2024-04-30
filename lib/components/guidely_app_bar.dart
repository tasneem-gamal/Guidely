import 'package:flutter/material.dart';
import 'package:guidely/utils/hex_color_conversion.dart';

class GuidelyAppBar extends StatelessWidget implements PreferredSizeWidget {

  const GuidelyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Guidely",
        style: TextStyle(
            color: Color(hexColorToAARRGGBB("#067A5A")),
            fontWeight: FontWeight.bold),
      ),
      actions: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Icon(
            Icons.notifications_outlined,
            size: 30,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
