import 'package:jne/controllers/auth_controller.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/controllers/organization_controller.dart';
import 'package:jne/controllers/splash_controller.dart';
import 'package:jne/controllers/zoom_drawer_controller.dart';
import 'package:jne/screens/detail/detail_screen.dart';
import 'package:jne/screens/home/home_screen.dart';
import 'package:jne/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:jne/screens/organization/organization_filter_screen.dart';
import 'package:jne/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splashPage = "/splash";
  static const String homePage = "/";
  static const String loginPage = "/login";

  static const String cardDetailPage = "/card-detail";
  static const String organizationFilterPage = "/organization-filter";

  static List<GetPage> routes() => [
        GetPage(
          name: splashPage,
          page: () => const SplashScreen(),
          binding: BindingsBuilder(() {
            Get.put(SplashController());
          }),
        ),
        GetPage(
          name: homePage,
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            //Get.put(AuthController());
            Get.put(HomeController());
            //Get.put(MyZoomDrawerController());
          }),
        ),
        GetPage(
          name: loginPage,
          page: () => const LoginScreen(),
          binding: BindingsBuilder(() {
            Get.put(AuthController());
            Get.put(MyZoomDrawerController());
          }),
        ),
        GetPage(
          name: cardDetailPage,
          page: () => const DetailScreen(),
          binding: BindingsBuilder(() {
            //Get.put(SplashController());
          }),
        ),
        GetPage(
          name: organizationFilterPage,
          page: () => const OrganizationFilterScreen(),
          binding: BindingsBuilder(() {
            Get.put(OrganizationController());
          }),
        ),
      ];
}
