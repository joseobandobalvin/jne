import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/controllers/auth_controller.dart';
import 'package:jne/screens/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            width: double.maxFinite,
            // decoration: BoxDecoration(
            //   gradient: mainGradient(),
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
