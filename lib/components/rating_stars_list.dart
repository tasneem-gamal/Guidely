import 'package:flutter/material.dart';

class RatingStarsList extends StatelessWidget {
  
  final int numberOfStars;
  
  const RatingStarsList(
    {
    super.key,
    required this.numberOfStars
    });

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (var i = 0; i < numberOfStars; i++){
      stars.add(
        Icon(
          Icons.star, size: 20,
          color: Colors.amber,
          ));
    }
    return Row(children: stars,);
  }
}