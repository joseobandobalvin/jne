import 'package:jne/controllers/theme_controller.dart';
import 'package:jne/models/user.dart';

import 'package:get/get.dart';

//another

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
  }
}
