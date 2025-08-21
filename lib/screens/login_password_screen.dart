import 'package:chats/helper/components/components.dart';
import 'package:chats/helper/services.dart';
import 'package:chats/screens/chat_screen.dart';
import 'package:chats/screens/login_email_screen.dart';
import 'package:chats/screens/register_email_screen.dart';
import 'package:chats/widgets/arrow_navigator.dart';
import 'package:chats/widgets/head_login_screen.dart';
import 'package:chats/widgets/navigator_method.dart';
import 'package:chats/widgets/shadow_of_head_of_screens.dart';
import 'package:chats/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

class LoginPasswordScreen extends StatelessWidget {
  LoginPasswordScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey();

  var loginPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeadRegistrationScreens(
            titleOfScreen: "Login",
              title: "Enter Your Password",
            onPressed: ()
            {
              navigator(context, RegisterEmailScreen());
            },
            textElevatedButton: "Register",
          ),
          ShadowOfHeadOfScreens(),
          Spacer(flex: 1,),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    isPassword: true,
                    controller: loginPasswordController,
                    validator: (value)
                    {
                      if(value == null || value.isEmpty)
                      {
                        return "You must enter the password";
                      } else
                      {
                        return null;
                      }
                    },
                      label: "Password",
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ArrowNavigator(
                    onTap: () async {
                      if(formKey.currentState!.validate())
                      {
                        try {
                          await loginWithEmailAndPassword(
                              email: LoginEmailScreen.loginEmailController.text,
                              password: loginPasswordController.text,
                          );
                          navigator(context, ChatScreen(
                            email: LoginEmailScreen.loginEmailController.text,
                          ));
                          print("Logged in success");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context, "No user found for that email.");
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context, "Wrong password provided for that user.");
                          } else
                          {
                            showSnackBar(context, "${e.code}");
                          }
                        } catch (e)
                        {
                          print("there an error when logging in ...... ${e.toString()}");
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Spacer(flex: 4,),
        ],
      ),
    );
  }
}
