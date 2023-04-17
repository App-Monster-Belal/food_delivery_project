import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_project/const/App_colors.dart';
import 'package:food_delivery_project/user_interface/route/route.dart';

import 'package:food_delivery_project/widget/customButton.dart';
import 'package:food_delivery_project/widget/customTextFormField.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Registration extends StatefulWidget {


  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  XFile? _image;

  chooseImageGallery() async {
    final ImagePicker _picker = ImagePicker();
    _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Create a new Account",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: appColors.blue),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Stack(
                      children: [
                        _image == null
                            ? CircleAvatar(
                          radius: 50, backgroundColor: Colors.grey,
                              child: IconButton(
                          onPressed: () => chooseImageGallery(),
                          icon: Icon(
                              Icons.camera_alt_outlined,
                              size: 20, color: Colors.black,
                          ),
                        ),
                            )
                            : CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(
                            File(_image!.path),
                          ),
                        ),
                      ],
                    ),

                    customTextFormField(TextInputType.name, _usernameController,
                        (value) {
                      if (value!.isEmpty) {
                        return "User Name can,t be Empty";
                      }
                    }, "User Name", Icons.person_2_outlined),
                    customTextFormField(
                        TextInputType.emailAddress, _emailController, (value) {
                      if (value!.isEmpty) {
                        return "Field Can't be Empty";
                      } else if (value.length < 6) {
                        return "Email Address Must be greater than 6";
                      }
                    }, "Email Address", Icons.mail_outline),
                    customTextFormField(
                        TextInputType.phone, _phoneNumberController, (value) {
                      if (value!.isEmpty) {
                        return "Phone Number Can't be Empty";
                      } else if (value.length < 10) {
                        return "Phone Number should be must be 11 digit";
                      }
                    }, "Phone Number", Icons.call_outlined),
                    customTextFormField(
                      TextInputType.text,
                      _passController,
                      (value) {
                        if (value!.isEmpty) {
                          return "field can't be empty";
                        } else if (value.length < 8) {
                          return "Password can't be less than 8";
                        }
                      },
                      "Password",
                      Icons.lock_outline_rounded,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CustomButton("Sign Up", () {
                      if(_image==null){
                        Get.snackbar("Warning!", "Please Upload an Image");
                      } else if (_formKey.currentState!.validate()) {
                        Get.toNamed(logIn);
                      }
                    }),
                    Divider(),
                    RichText(
                      text: TextSpan(
                          text: "Have an account?  ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                                text: "Click here to log in",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.toNamed(logIn))
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
