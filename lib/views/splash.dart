import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_project/const/App_colors.dart';
import 'package:food_delivery_project/const/App_name.dart';
import 'package:food_delivery_project/user_interface/route/route.dart';
import 'package:food_delivery_project/views/homepage.dart';
import 'package:food_delivery_project/views/onboarding_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  final box= GetStorage();
  choosen_screen(context) {
    var value = box.read("checked");
   print(value);
   if (value==true){
     Get.toNamed(home);
   }else {
     Get.toNamed(onBoarding);
   }
   
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),
            () => choosen_screen(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 150, left: 30, right: 30),
          child: Column(
            children: [
              Image.asset("assets/images/splash_.jpg"),
              Text(
                appName.appname,
                style: TextStyle(
                    fontSize: 30,
                    color: appColors.blue,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Times"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
