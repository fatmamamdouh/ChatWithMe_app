import 'package:chats/screens/login_email_screen.dart';
import 'package:chats/screens/register_password_screen.dart';
import 'package:chats/widgets/arrow_navigator.dart';
import 'package:chats/widgets/head_login_screen.dart';
import 'package:chats/widgets/navigator_method.dart';
import 'package:chats/widgets/shadow_of_head_of_screens.dart';
import 'package:chats/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterEmailScreen extends StatelessWidget {
  RegisterEmailScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey();
  static var registerEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeadRegistrationScreens(
            titleOfScreen: "Register",
              onPressed: ()
              {
                navigator(context, LoginEmailScreen());
              },
              title: "Enter Your Email",
              textElevatedButton: "Login",
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
                    controller: registerEmailController,
                      label: "E-mail",
                    validator: (value)
                    {
                      if(value == null || value.isEmpty)
                      {
                        return "You must enter the email";
                      } else
                      {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ArrowNavigator(
                    onTap: () async
                    {
                      if(formKey.currentState!.validate())
                      {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(
                              milliseconds: 500,
                            ), // Animation speed
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                RegisterPasswordScreen(),
                            transitionsBuilder:
                                (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0); // Start from right
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;

                              var tween = Tween(
                                begin: begin,
                                end: end,
                              ).chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      }
                    },
                  )
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
