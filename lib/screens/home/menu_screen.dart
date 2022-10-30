import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/configs/themes/ui_parameters.dart';
import 'package:jne/controllers/auth_controller.dart';
import 'package:jne/controllers/zoom_drawer_controller.dart';
import 'package:jne/providers/local/auth_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  MenuScreen({super.key});
  final AuthClient _authClient = AuthClient();

  isLogged() async {
    String? token = await _authClient.token;
    //await _authClient.signOut();
    print(token);
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: onSurfaceTextColor),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toogleDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3,
                ),
                child: Column(
                  children: [
                    const Text("hi there"),
                    const Spacer(flex: 1),
                    _DrawerButton(
                      icon: Icons.web,
                      label: "Website",
                      onPressed: () => controller.website(),
                    ),
                    _DrawerButton(
                      icon: Icons.facebook,
                      label: "Facebook",
                      onPressed: isLogged,
                    ),
                    _DrawerButton(
                      icon: Icons.email,
                      label: "Email",
                      onPressed: () => controller.email(),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    _DrawerButton(
                      icon: Icons.login,
                      label: isLogged() != null ? "Login" : "Logout",
                      onPressed: () => controller.signIn(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 14,
      ),
      label: Text(label),
    );
  }
}
