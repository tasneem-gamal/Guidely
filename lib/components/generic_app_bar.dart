import 'package:flutter/material.dart';

class GenericAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  
  const GenericAppBar(
    {
      super.key,
      required this.title
    });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500),
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
