import 'package:jne/models/academic_formation.dart';
import 'package:jne/models/general_data.dart';
import 'package:jne/models/trajectory.dart';
import 'package:jne/models/work_experience.dart';

class User {
  final GeneralData datoGeneral;
  final List<WorkExperience> experienciaLaboral;
  final AcademicFormation formacionAcademica;
  final Trajectory trayectoria;

  User({
    required this.datoGeneral,
    required this.experienciaLaboral,
    required this.formacionAcademica,
    required this.trayectoria,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var list = json['experienciaLaboral'] as List;

    List<WorkExperience> workExperienceList =
        list.map((i) => WorkExperience.fromJson(i)).toList();

    return User(
      datoGeneral: GeneralData.fromJson(json["datoGeneral"]),
      experienciaLaboral: workExperienceList,
      formacionAcademica:
          AcademicFormation.fromJson(json["formacionAcademica"]),
      trayectoria: Trajectory.fromJson(json["trayectoria"]),
    );
  }
}
