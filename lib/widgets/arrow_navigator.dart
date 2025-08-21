import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

class ArrowNavigator extends StatelessWidget {
  ArrowNavigator({super.key, required this.onTap});

  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          child: CircleAvatar(
            backgroundColor: secondaryColor,
            radius: 30,
            child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 40),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
