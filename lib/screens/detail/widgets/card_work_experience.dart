import 'package:flutter/material.dart';
import 'package:jne/models/work_experience.dart';

class CardWorkExperience extends StatelessWidget {
  final WorkExperience workExperience;
  const CardWorkExperience(this.workExperience, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
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
          Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  color: Colors.blueAccent,
                  child: Text("${workExperience.trabajoDepartamento}"),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  color: Colors.yellow,
                  child: Text("${workExperience.trabajoProvincia}"),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  color: Colors.red,
                  child: Text("${workExperience.trabajoDistrito}"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
