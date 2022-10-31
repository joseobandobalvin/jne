import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    getCandidatos();
    super.onReady();
  }

  getCandidatos() {
    print("HomeController Print");
  }
}
