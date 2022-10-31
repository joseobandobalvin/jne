import 'package:get/get.dart';
import 'package:jne/providers/remote/user_provider.dart';

class SplashController extends GetxController {
  UserProvider _userProvider = UserProvider();

  @override
  void onReady() {
    initSplash();
    super.onReady();
  }

  Future initSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    final res = await _userProvider.getAllCandidates();
    navigateToHome();
  }

  void navigateToHome() {
    Get.offAllNamed("/home");
  }
}
