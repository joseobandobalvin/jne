import 'package:jne/models/user.dart';
import 'package:jne/providers/local/auth_client.dart';
import 'package:jne/repo/account_repo.dart';
import 'package:jne/repo/auth_repo.dart';
import 'package:jne/repo_imp/account_repo_imp.dart';
import 'package:jne/repo_imp/auth_repo_imp.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AuthController extends GetxController {
  String _email = "", _password = "";

  final AuthRepoImp _authRepoImp = AuthRepoImp();
  final AuthClient _authClient = AuthClient();
  //final AccountRepoImp _accountRepoImp = AccountRepoImp();

  @override
  void onReady() {
    super.onReady();
  }

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
