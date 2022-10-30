import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/widgets/global_widgets/input_text.dart';

class SearchForm extends GetView<HomeController> {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const InputText(
      prefixIcon: Icon(Icons.lock),
      //obscureText: true,
      labelText: "Nombre o Dni",
      textInputAction: TextInputAction.next,
      //onChanged: controller.onPasswordChanged,
      //onSubmitted: (text) => _submit(context),
    );
  }
}
