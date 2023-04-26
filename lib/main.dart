import 'package:flutter/material.dart';
import 'package:food_delivery_project/user_interface/route/route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Hive.initFlutter();
  Box box = await Hive.openBox("contact_list");
  runApp(
      foodDelivery()
  );
}

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
