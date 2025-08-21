import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';
import '../style/colors.dart';

class ChatBubbleForFriend extends StatelessWidget {
  ChatBubbleForFriend({super.key, required this.messageModel});

  MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff1565C0),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              messageModel.messageText,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${DateTime.now().hour} : ${DateTime.now().minute}",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),),
          ],
        ),
      ),
    );
  }
}
