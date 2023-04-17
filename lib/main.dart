import 'package:flutter/material.dart';
import 'package:food_delivery_project/user_interface/route/route.dart';
import 'package:food_delivery_project/views/authentication/login.dart';
import 'package:food_delivery_project/views/authentication/registration.dart';
import 'package:food_delivery_project/views/homepage.dart';
import 'package:food_delivery_project/views/onboarding_screen.dart';
import 'package:food_delivery_project/views/splash.dart';
import 'package:get/get.dart';
void main()=> runApp(foodDelivery());

class foodDelivery extends StatelessWidget {
  const foodDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "times_bold",

      ),
initialRoute: splash,
      getPages: getPages,
    );
  }
}
