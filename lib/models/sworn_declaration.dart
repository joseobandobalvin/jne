import 'package:jne/models/income.dart';

class SwornDeclaration {
  List<Income> ingreso;

  SwornDeclaration({
    required this.ingreso,
  });

  factory SwornDeclaration.fromJson(Map<String, dynamic> json) {
    var list = json['ingreso'] as List;

    List<Income> ingresoList = list.map((i) => Income.fromJson(i)).toList();

    return SwornDeclaration(
      ingreso: ingresoList,
    );
  }
}
