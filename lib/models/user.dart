import 'package:jne/models/general_data.dart';

class User {
  GeneralData datoGeneral;

  User({required this.datoGeneral});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(datoGeneral: GeneralData.fromJson(json["datoGeneral"]));
  }
}
