import 'package:chats/helper/components/components.dart';
import 'package:chats/helper/services.dart';
import 'package:chats/screens/login_email_screen.dart';
import 'package:chats/screens/register_email_screen.dart';
import 'package:chats/widgets/head_login_screen.dart';
import 'package:chats/widgets/navigator_method.dart';
import 'package:chats/widgets/shadow_of_head_of_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/arrow_navigator.dart';
import '../widgets/text_form_field.dart';

class RegisterPasswordScreen extends StatelessWidget {
  RegisterPasswordScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey();
  var registerPasswordController = TextEditingController();


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
              title: "Enter Your Password",
              textElevatedButton: "Login",
          ),
          ShadowOfHeadOfScreens(),
          Spacer(flex: 1,),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    isPassword: true,
                    controller: registerPasswordController,
                    label: "Password",
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
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ArrowNavigator(
                    onTap: () async
                    {
                      if(formKey.currentState!.validate())
                      {
                        try
                        {
                           await registerWithEmailAndPassword(
                              email: RegisterEmailScreen.registerEmailController.text,
                              password: registerPasswordController.text,
                          );
                           print("Regiter success =======");
                           Navigator.push(
                             context,
                             PageRouteBuilder(
                               transitionDuration: Duration(
                                 milliseconds: 500,
                               ), // Animation speed
                               pageBuilder: (context, animation, secondaryAnimation) =>
                                   LoginEmailScreen(),
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
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                           showSnackBar(context, 'The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context, 'The account already exists for that email.');
                          } else
                          {
                            showSnackBar(context, "${e.code}");
                          }
                        } catch (e) {
                          print("there an error when registering ...... ${e.toString()}");
                          showSnackBar(context, "There was an error, please try again later");
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

//
// print("Regiter success =======");
// Navigator.push(
// context,
// PageRouteBuilder(
// transitionDuration: Duration(
// milliseconds: 500,
// ), // Animation speed
// pageBuilder: (context, animation, secondaryAnimation) =>
// LoginEmailScreen(),
// transitionsBuilder:
// (context, animation, secondaryAnimation, child) {
// const begin = Offset(1.0, 0.0); // Start from right
// const end = Offset.zero;
// const curve = Curves.easeInOut;
//
// var tween = Tween(
// begin: begin,
// end: end,
// ).chain(CurveTween(curve: curve));
//
// return SlideTransition(
// position: animation.drive(tween),
// child: child,
// );
// },
// ),
// );