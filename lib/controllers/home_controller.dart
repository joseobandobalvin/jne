import 'package:get/get.dart';
import 'package:jne/models/user.dart';
import 'package:jne/providers/remote/user_provider.dart';

class HomeController extends GetxController {
  final UserProvider _userProvider = UserProvider();

  @override
  void onReady() {
    super.onReady();
  }

  Future<List<User>> getCandidates() async {
    final res = await _userProvider.getAllCandidates();
    List<User> usuarios = [];

    if (res != null && res["count"] > 0.0) {
      final lista = List.from(res['data']);
      for (var e in lista) {
        final User user = User.fromJson(e);
        usuarios.add(user);
      }
      return usuarios;
    }

    return usuarios;
  }
}
