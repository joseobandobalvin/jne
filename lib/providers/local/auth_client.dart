import 'package:jne/models/cv.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _key = "token";
final Future<SharedPreferences> _preferences = SharedPreferences.getInstance();

class AuthClient {
  //AuthClient(this._preferences);

  Future<void> saveToken(String token) async {
    final SharedPreferences preferences = await _preferences;
    await preferences.setString(_key, token);
  }

  Future<void> signOut() async {
    final SharedPreferences preferences = await _preferences;
    await preferences.remove(_key);
  }

  Future<String?> get token async {
    final SharedPreferences preferences = await _preferences;
    return preferences.getString(_key).toString();
  }

  Future<void> saveUserInformacion(Map<String, dynamic> data) async {
    final SharedPreferences preferences = await _preferences;
    await preferences.setString("name", data['name']);
    await preferences.setString("email", data['email']);
    await preferences.setString("ruc", data['ruc']);
  }

  Future<Cv?> get userInformation async {
    final SharedPreferences preferences = await _preferences;

    // ignore: unnecessary_null_comparison
    if (preferences.getString("token") == null) {
      throw Exception('token is null');
    }

    // return User(
    //   name: preferences.getString("name").toString(),
    //   email: preferences.getString("email").toString(),
    //   ruc: preferences.getString("ruc").toString(),
    // );
  }
}
