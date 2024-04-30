import 'package:flutter/material.dart';
import 'package:guidely/utils/hex_color_conversion.dart';

class GuidelyGenericButton extends StatelessWidget {

  final String text;
  final Function onTapAction;

  const GuidelyGenericButton(
    {
      super.key,
      required this.text,
      required this.onTapAction
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTapAction();},
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w700
            )
            )
          ),
        decoration: BoxDecoration(
          color: Color(hexColorToAARRGGBB('#067A5A')),
          borderRadius: BorderRadius.all(Radius.circular(12))
        ),
      ),
    );
  }
}