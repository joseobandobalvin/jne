import 'package:jne/controllers/auth_controller.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/controllers/splash_controller.dart';
import 'package:jne/controllers/zoom_drawer_controller.dart';
import 'package:jne/screens/home/home_screen.dart';
import 'package:jne/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:jne/screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => const SplashScreen(),
          binding: BindingsBuilder(() {
            Get.put(SplashController());
          }),
        ),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(AuthController());
            Get.put(HomeController());
            Get.put(MyZoomDrawerController());
          }),
        ),
        GetPage(
          name: "/login",
          page: () => const LoginScreen(),
          binding: BindingsBuilder(() {
            Get.put(AuthController());
            Get.put(MyZoomDrawerController());
          }),
        ),
      ];
}
