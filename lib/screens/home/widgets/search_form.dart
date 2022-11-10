import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/widgets/global_widgets/input_text.dart';

class SearchForm extends GetView<HomeController> {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  //prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      /* Clear the search field */
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
            ),
          ),
        ),
        backgroundColor: kDarkBlue,
      ),
      body: const InputText(
        prefixIcon: Icon(Icons.lock),
        //obscureText: true,
        labelText: "Nombre o Dni",
        textInputAction: TextInputAction.next,
        //onChanged: controller.onPasswordChanged,
        //onSubmitted: (text) => _submit(context),
      ),
    );
    // return const InputText(
    //   prefixIcon: Icon(Icons.lock),
    //   //obscureText: true,
    //   labelText: "Nombre o Dni",
    //   textInputAction: TextInputAction.next,
    //   //onChanged: controller.onPasswordChanged,
    //   //onSubmitted: (text) => _submit(context),
    // );
  }
}
