import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

class HeadRegistrationScreens extends StatelessWidget {
  HeadRegistrationScreens({super.key, required this.titleOfScreen, required this.onPressed, required this.title, required this.textElevatedButton});

  VoidCallback onPressed;
  String title;
  String titleOfScreen;
  String textElevatedButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff092A51),
      child: Padding(
        padding: const EdgeInsets.only(
            right: 20.0,
            left: 20.0,
            bottom: 8.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Text(
                  titleOfScreen,
                  style: TextStyle(
                    fontSize: 35,
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2C2D3A),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    textElevatedButton,
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: secondaryColor,
              ),),
          ],
        ),
      ),
    );
  }
}
