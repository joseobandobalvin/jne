import 'package:jne/providers/local/auth_client.dart';

import 'package:jne/repo_imp/auth_repo_imp.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  String _email = "", _password = "";

  final AuthRepoImp _authRepoImp = AuthRepoImp();
  final AuthClient _authClient = AuthClient();
  //final AccountRepoImp _accountRepoImp = AccountRepoImp();

  void onEmailChanged(String t) {
    _email = t;
  }

  void onPasswordChanged(String t) {
    _password = t;
  }

  Future<bool> submit() async {
    String? token =
        await _authRepoImp.signInWithEmailAndPassword(_email, _password);

    //AuthRepo wes = AuthRepoImp().signInWithEmailAndPassword(_email, _password);
    if (token != null) {
      await _authRepoImp.saveToken(token);
      return true;
    }
    return false;
  }

  Future getPreferences() async {
    //String? toke = await _authRepoImp.getToken("token");
    String? t = await _authClient.token;
  }

  void signOut() {
    print("saliendo");
    try {
      _authClient.signOut();
      navigateToLoginPage();
    } catch (e) {
      print(e);
    }
  }

  signIn() {
    navigateToLoginPage();
  }

  void navigateToLoginPage() {
    Get.offAllNamed("/login");
  }

  void navigateToHomePage() {
    Get.offAllNamed("/");
  }
}
