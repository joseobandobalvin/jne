abstract class AuthRepo {
  Future<String?> signInWithEmailAndPassword(String email, String password);
  Future<void> saveToken(String token);
  Future<String?> get token;
}
