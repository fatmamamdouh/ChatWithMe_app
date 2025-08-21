import 'package:chats/screens/login_password_screen.dart';
import 'package:chats/screens/register_email_screen.dart';
import 'package:chats/widgets/arrow_navigator.dart';
import 'package:chats/widgets/head_login_screen.dart';
import 'package:chats/widgets/navigator_method.dart';
import 'package:chats/widgets/shadow_of_head_of_screens.dart';
import 'package:chats/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

class LoginEmailScreen extends StatelessWidget {
  LoginEmailScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey();
  static var loginEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeadRegistrationScreens(
            titleOfScreen: "Login",
            title: "Enter Your Email",
            textElevatedButton: "Register",
            onPressed: ()
            {
              navigator(context, RegisterEmailScreen());
            },
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
                    controller: loginEmailController,
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
                      label: "E-mail",
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ArrowNavigator(
                    onTap: () {
                      if(formKey.currentState!.validate())
                      {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(
                              milliseconds: 500,
                            ), // Animation speed
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                LoginPasswordScreen(),
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
