import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_project/const/App_colors.dart';
import 'package:food_delivery_project/user_interface/route/route.dart';
import 'package:food_delivery_project/widget/customButton.dart';
import 'package:food_delivery_project/widget/customTextFormField.dart';
import 'package:get/get.dart';

class login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                Text(
                  "Hello, Welcome Back!",
                  style: TextStyle(fontSize: 30, color: appColors.blue),
                ),
                SizedBox(
                  height: 50,
                ),
                customTextFormField(
                  TextInputType.emailAddress,
                  _emailController,
                  (value) {
                    if (value!.isEmpty) {
                      return "field can't be empty";
                    } else if (value.length < 6) {
                      return "Email address can't be less than 6";
                    }
                  },
                  "Email",
                  Icons.mail_outline,
                ),
                SizedBox(
                  height: 20,
                ),
                customTextFormField(TextInputType.text, _passwordController,
                    (value) {
                  if (value!.isEmpty) {
                    return "field can't be empty";
                  } else if (value.length < 8) {
                    return "Password can't be less than 8";
                  }
                }, "Password", Icons.lock_outline_rounded,
                    obscureText: true,
                    suffixIcon: Icons.remove_red_eye_outlined),
                SizedBox(
                  height: 50,
                ),
                CustomButton("Log In", () {
                  if (_formKey.currentState!.validate()) {
                    Get.toNamed(home);
                  }
                }),
                SizedBox(
                  height: 30,
                ),
                RichText(text: TextSpan(text: "Don't have account?  ",
                    style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                children: [
                  TextSpan( recognizer: TapGestureRecognizer()..onTap=()=> Get.toNamed(registration),
                      text: "Create a new account", style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w500))
                ]
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
