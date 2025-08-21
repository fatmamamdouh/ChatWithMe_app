import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';
import '../style/colors.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.messageModel});

  MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              messageModel.messageText,
              style: TextStyle(
                fontSize: 16,
                color: primaryColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
            "${DateTime.now().hour} : ${DateTime.now().minute}",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),),
          ],
        ),
      ),
    );
  }
}


