import 'package:jne/helpers/http.dart';
import 'package:jne/helpers/http_method.dart';

import 'package:jne/providers/local/auth_client.dart';

import 'package:http/http.dart' as http;

class AuthProvider {
  final Http _http = Http();
  final AuthClient _authClient = AuthClient();

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await _http.request(
        '/api/login',
        method: HttpMethod.post,
        body: {
          'email': email,
          'password': password,
        },
      );
      // print("result data");
      // print(result.statusCode);
      // print(result.error);
      // print(result.data);

      // if (result.error == null) {}

      // var url = Uri.https('full.facturalo.pro', 'api/login');
      // var response =
      //     await http.post(url, body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        //var data = jsonDecode(response.data.toString());

        //print(data['token']);
        if (response.data['success']) {
          _authClient.saveUserInformacion(response.data);

          return response.data['token'];
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    // if (email == "test@test.com" && password == "test") {
    //   final String token = DateTime.now().millisecondsSinceEpoch.toString();
    //   return token;
    // }
    //return null;
    //demo@gmail.com    123456
  }
}
