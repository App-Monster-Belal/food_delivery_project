import 'package:flutter/material.dart';

Widget customTextFormField(keyboard, controller, validator ,hint,prefixIcon,{suffixIcon, obscureText=false} ){
  return TextFormField(
    keyboardType: keyboard,
    controller: controller,
    validator: validator,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hint ,
      prefixIcon: Icon(prefixIcon, color: Colors.blue,),
      suffixIcon: Icon(suffixIcon),



    ),

  );

}