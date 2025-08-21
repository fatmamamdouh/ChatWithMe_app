import 'package:chats/models/message_model.dart';
import 'package:chats/screens/login_email_screen.dart';
import 'package:chats/style/colors.dart';
import 'package:chats/widgets/chat_bubble.dart';
import 'package:chats/widgets/chat_bubble_for_friend.dart';
import 'package:chats/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../helper/services.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.email});

  String email;
  var messageController  = TextEditingController();
  var listViewController = ScrollController();
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy("createdAt", descending: true).snapshots(),
        builder: (context, snapshot)
        {
          if(snapshot.hasData)
          {
            List<MessageModel> messagesList = [];
            for(int i = 0 ; i < snapshot.data!.docs.length ; i++)
            {
              messagesList.add(
                  MessageModel.fromJson(snapshot.data!.docs[i].data() as Map<String, dynamic>)
              );
            }
            return Scaffold(
              backgroundColor: Color(0xff2C2D3A),
              appBar: AppBar(
                leading: GestureDetector(
                  onTap: ()
                  {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xff3E3E3E),
                      radius: 21,
                      child: Icon(Icons.arrow_back_sharp, color: Colors.white,),
                    ),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  "Message",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Color(0xff3E3E3E),
                        radius: 21,
                        child: Icon(Icons.menu_outlined, color: Colors.white,),
                      ),
                    ),
                  ),
                ],
                backgroundColor: primaryColor,
              ),
              body: Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: listViewController,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index)
                        {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: messagesList[index].email == LoginEmailScreen.loginEmailController.text ? ChatBubble(
                                messageModel: messagesList[index],) : ChatBubbleForFriend(
                              messageModel: messagesList[index],
                            ),
                          );
                        },

                      ),
                    ),
                    Container(
                      color: primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xff3E3E3E),
                              radius: 21,
                              child: Icon(
                                Icons.add,
                                size: 32,
                                color: secondaryColor,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller: messageController,
                                validator: (value){},
                                label: "Type a message",
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: ()
                              {
                                addMessage(messageController.text, email);
                                messageController.clear();
                                listViewController.animateTo(
                                  0,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: secondaryColor,
                                radius: 21,
                                child: Icon(
                                  Icons.send_outlined,
                                  size: 26,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else
          {
            return Center(child: CircularProgressIndicator(
              color: secondaryColor,
            ));
          }
        },
    );
  }
}
