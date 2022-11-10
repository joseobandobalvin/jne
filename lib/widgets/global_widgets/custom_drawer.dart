import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jne/configs/themes/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          curve: Curves.easeInSine,
          duration: Duration(milliseconds: 20),
          decoration: BoxDecoration(
            color: kDarkBlue,
          ),
          child: Text(''),
        ),
        ListTile(
          leading: const Icon(
            Icons.home_filled,
            color: Colors.black,
          ),
          title: const Text('Inicio'),
          onTap: () {
            Get.offAllNamed("/");
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.filter_list,
            color: Colors.black,
          ),
          title: const Text('Lista por Region'),
          onTap: () {
            Get.offAllNamed("/organization-filter");
          },
        ),
      ],
    );
  }
}
