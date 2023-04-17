import 'package:food_delivery_project/views/authentication/login.dart';
import 'package:food_delivery_project/views/onboarding_screen.dart';
import 'package:food_delivery_project/views/splash.dart';
import 'package:get/get.dart';
import '../../views/authentication/registration.dart';
import '../../views/homepage.dart';

const String splash = "/splash";
const String onBoarding = "/onBoarding";
const String logIn = "/logIn";
const String registration = "/registration";
const String home = "/home";

List<GetPage> getPages = [
  GetPage(name: splash, page: () => Splash_screen()),
  GetPage(name: onBoarding, page: () => Onboard()),
  GetPage(name: logIn, page: () => login()),
  GetPage(name: registration, page: () => Registration()),
  GetPage(name: home, page: () => Home())
];
