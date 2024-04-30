import 'package:flutter/material.dart';
import 'package:guidely/utils/hex_color_conversion.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jaime Lorente',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              Divider(
                  thickness: 0.8,
                  color: Colors.grey,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Options',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.8,
                  color: Colors.grey,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Language',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              Divider(
                  thickness: 0.8,
                  color: Colors.grey,
                ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Connect to Us',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              Divider(
                  thickness: 0.8,
                  color: Colors.grey,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Color(hexColorToAARRGGBB("#067A5A")),
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                ),
            ],
          ),
      ),
    );
  }
}