import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  final String title;
  final String imgUrl;
  final double width;
  final double height;
  final double titleFontSize;
  final String itemId;
  final Color titleColor;
  final bool alignTitleBottomLeft;
  final Function onTapAction;

  const DisplayCard(
      {super.key,
      required this.title,
      required this.imgUrl,
      required this.height,
      required this.width,
      required this.titleFontSize,
      required this.itemId,
      required this.titleColor,
      required this.alignTitleBottomLeft,
      required this.onTapAction
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapAction();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover)),
        child: Align(
            alignment:
                alignTitleBottomLeft ? Alignment.bottomLeft : Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  title,
                  style: TextStyle(
                      color: titleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: titleFontSize),
                ))),
      ),
    );
  }
}
