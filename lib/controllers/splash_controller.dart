import 'package:get/get.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/models/user.dart';
import 'package:jne/providers/remote/user_provider.dart';

class SplashController extends GetxController {
  HomeController _homeController = HomeController();
  late Future<List<User>> usuarios;

  @override
  void onReady() {
    initSplash();
    super.onReady();
  }

  Future initSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    usuarios = _homeController.getCandidates();
    print(usuarios);
    navigateToHome();
  }

  void navigateToHome() {
    //Get.offAllNamed("/home", arguments: response);
    Get.offAllNamed("/home", arguments: usuarios);
  }
}
