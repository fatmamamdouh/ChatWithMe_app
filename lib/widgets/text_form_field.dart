import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, this.isPassword = false, required this.controller, required this.validator, required this.label});

  FormFieldValidator<String> validator;
  var controller = TextEditingController();
  String label;
  bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      validator: validator,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: secondaryColor,
      decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: secondaryColor,
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: secondaryColor,
              )
          )
      ),
    );
  }
}
