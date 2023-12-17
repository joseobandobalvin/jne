import 'package:get/get.dart';

class SplashController extends GetxController {
  //HomeController _homeController = HomeController();
  //late Future<List<User>> usuarios;

  @override
  void onReady() {
    initSplash();
    super.onReady();
  }

  Future initSplash() async {
    //await Future.delayed(const Duration(seconds: 2));
    //usuarios = _homeController.getCandidates();
    //print(usuarios);
    navigateToHome();
  }

  void navigateToHome() {
    //Get.offAllNamed("/home", arguments: response);
    Get.offAllNamed("/home");
  }
}
