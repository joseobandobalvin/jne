import 'package:get/get.dart';
import 'package:jne/models/cv.dart';
import 'package:jne/models/user.dart';
import 'package:jne/providers/remote/user_provider.dart';

class HomeController extends GetxController {
  final UserProvider _userProvider = UserProvider();

  @override
  void onReady() {
    super.onReady();
  }

  Future<List<Cv>> getCandidates() async {
    final res = await _userProvider.getAllCandidates();
    List<Cv> usuarios = [];

    //print(res);

    if (res != null && res["count"] > 0.0) {
      final lista = List.from(res['data']);
      for (var e in lista) {
        final Cv user = Cv.fromJson(e);
        usuarios.add(user);
      }
      return usuarios;
    }

    return usuarios;
  }

  Future<List<Cv>> getCandidatesByName(query) async {
    final res = await _userProvider.getAllCandidatesByName(query);
    List<Cv> usuarios = [];

    if (res != null && res["count"] > 0.0) {
      final lista = List.from(res['data']);
      for (var e in lista) {
        final Cv user = Cv.fromJson(e);
        usuarios.add(user);
      }
      return usuarios;
    }

    return usuarios;
  }

  Future getUserInformation(idHojaVida) async {
    final res = await _userProvider.getUserInformation(idHojaVida);

    return res;
    // List<User> usuarios = [];

    // if (res != null) {
    //   final lista = List.from(res['data']);
    //   for (var e in lista) {
    //     final User user = User.fromJson(e);
    //     usuarios.add(user);
    //   }
    //   return usuarios;
    //}

    // return usuarios;
  }
}
