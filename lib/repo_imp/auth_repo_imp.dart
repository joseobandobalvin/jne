import 'package:jne/providers/local/auth_client.dart';
import 'package:jne/providers/remote/auth_provider.dart';
import 'package:jne/repo/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final AuthProvider _authProvider = AuthProvider();
  final AuthClient _authClient = AuthClient();

  @override
  Future<String?> signInWithEmailAndPassword(String email, String password) {
    return _authProvider.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<String?> get token {
    return _authClient.token;
  }

  @override
  Future<void> saveToken(String token) {
    return _authClient.saveToken(token);
  }
}
