import 'package:get/get.dart';
import 'package:jne/models/cv.dart';
import 'package:jne/providers/remote/user_provider.dart';

class SearchController extends GetxController {
  final UserProvider _userProvider = UserProvider();

  Future<List<Cv>> searchCandidates(t) async {
    final res = await _userProvider.searchAllCandidates(t);
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
}
