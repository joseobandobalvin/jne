import 'package:jne/controllers/auth_controller.dart';
import 'package:jne/generated/l10n.dart';
import 'package:jne/models/cv.dart';
import 'package:jne/widgets/dialogs.dart';
import 'package:jne/widgets/global_widgets/input_text.dart';
import 'package:jne/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends GetView<AuthController> {
  const LoginForm({super.key});

  void _submit(BuildContext context) async {
    ProgressDialog.show(context);
    final bool loginOk = await controller.submit();
    Navigator.pop(context);
    if (!loginOk) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("ERROR"),
          content: const Text("Invalido: email o password"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    } else {
      // go to home
      controller.navigateToHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 340),
      child: Column(
        children: [
          InputText(
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (text) {
              if (text.contains("@")) return null;
              return "Email inválido";
            },
            labelText: "Email",
            textInputAction: TextInputAction.next,
            onChanged: controller.onEmailChanged,
          ),
          const SizedBox(height: 20),
          InputText(
            prefixIcon: Icon(Icons.lock),
            obscureText: true,
            labelText: "Contraseña",
            textInputAction: TextInputAction.next,
            onChanged: controller.onPasswordChanged,
            onSubmitted: (text) => _submit(context),
          ),
          const SizedBox(height: 20),
          RoundedButton(
            label: S.of(context).ingresar,
            onPressed: () => _submit(context),
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 40),
          )
        ],
      ),
    );
  }
}
