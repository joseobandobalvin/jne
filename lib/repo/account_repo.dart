import 'package:jne/models/user.dart';

abstract class AccountRepo {
  Future<User?> get userInformation;
}
