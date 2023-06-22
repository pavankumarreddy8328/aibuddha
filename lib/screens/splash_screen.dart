import 'package:aibuddha/screens/screens_export.dart';
import 'package:aibuddha/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatelessWidget {
  //The key parameter allows for widget identification and differentiation,
  // while the super call delegates the key value to the superclass constructor for further processing if required.
  const SplashScreen({Key? key}) : super(key : key);
  static const routeName = "/";
  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3),(){
      Get.offAllNamed(HomeScreen.routeName);
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
            Color(0xFF9B51E0),
            Color(0xFF444CF7)
          ]),
          image: DecorationImage(image:  AssetImage(ImageConstant.aibuddhaLogo)))
        ),

    );
  }
}