import 'package:jne/models/income.dart';
import 'package:jne/models/ownership.dart';

class SwornDeclaration {
  List<Income> ingreso;
  List<Ownership> titularidad;

  SwornDeclaration({
    required this.ingreso,
    required this.titularidad,
  });

  factory SwornDeclaration.fromJson(Map<String, dynamic> json) {
    var list = json['ingreso'] as List;
    var list2 = json['titularidad'] as List;

    List<Income> ingresoList = list.map((i) => Income.fromJson(i)).toList();
    List<Ownership> titularidadList =
        list2.map((i) => Ownership.fromJson(i)).toList();

    return SwornDeclaration(
      ingreso: ingresoList,
      titularidad: titularidadList,
    );
  }
}
