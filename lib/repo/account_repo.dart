import 'package:jne/models/cv.dart';

abstract class AccountRepo {
  Future<Cv?> get userInformation;
}
