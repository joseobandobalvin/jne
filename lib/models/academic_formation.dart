import 'package:jne/models/basic_education.dart';
import 'package:jne/models/posgrade_education.dart';
import 'package:jne/models/technical_education.dart';
import 'package:jne/models/university_education.dart';

class AcademicFormation {
  BasicEducation educacionBasica;
  List<TechnicalEducation> educacionTecnico;
  List<UniversityEducation> educacionUniversitaria;
  List<PosgradeEducation> educacionPosgrado;

  AcademicFormation({
    required this.educacionBasica,
    required this.educacionTecnico,
    required this.educacionUniversitaria,
    required this.educacionPosgrado,
  });

  factory AcademicFormation.fromJson(Map<String, dynamic> json) {
    var list = json['educacionTecnico'] as List;
    var list2 = json['educacionUniversitaria'] as List;
    var list3 = json['educacionPosgrado'] as List;

    List<TechnicalEducation> educacionTecnicoList =
        list.map((i) => TechnicalEducation.fromJson(i)).toList();

    List<UniversityEducation> educacionUniversitariaList =
        list2.map((i) => UniversityEducation.fromJson(i)).toList();

    List<PosgradeEducation> posgradeEducationList =
        list3.map((i) => PosgradeEducation.fromJson(i)).toList();

    return AcademicFormation(
      educacionBasica: BasicEducation.fromJson(json["educacionBasica"]),
      educacionTecnico: educacionTecnicoList,
      educacionUniversitaria: educacionUniversitariaList,
      educacionPosgrado: posgradeEducationList,
    );
  }
}
