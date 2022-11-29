import 'package:flutter/material.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/models/work_experience.dart';

class CardWorkExperience extends StatelessWidget {
  final WorkExperience workExperience;
  const CardWorkExperience(this.workExperience, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          const Text(
            "NOMBRE DEL CENTRO DE PRESTACIÓN DEL SERVICIO O TRABAJO:",
          ),
          Text(
            "${workExperience.centroTrabajo}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "OFICIOS / OCUPACIONES / PROFESIONES:",
          ),
          Text(
            "${workExperience.ocupacionProfesion}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "${workExperience.trabajoDepartamento} / ${workExperience.trabajoProvincia} / ${workExperience.trabajoDistrito}",
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: kDarkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
