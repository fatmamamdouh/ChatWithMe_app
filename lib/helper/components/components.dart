import 'package:chats/style/colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(context, message)
{
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: secondaryColor,
          content: Text(message, style: TextStyle(
            color: Color(0xff092A51),
          ),),
      ),
  );
}