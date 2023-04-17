import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_project/const/App_colors.dart';

Widget CustomButton(title, ontap){
  return InkWell(
   splashColor: Colors.green,
    onTap: ontap,
    borderRadius: BorderRadius.circular(10),
    child: Ink(
      height: 40, width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: appColors.blue,

      ),

      child: Center(child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),), ),

    ),
  );
}