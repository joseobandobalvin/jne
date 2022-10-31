import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jne/controllers/splash_controller.dart';
import 'package:rive/rive.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        //decoration: BoxDecoration(gradient: mainGradient()),
        child: const RiveAnimation.asset(
          "assets/images/material-loader.riv",
        ),
      ),
    );
  }
}
