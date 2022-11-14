import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jne/models/general_data.dart';
import 'package:jne/models/user.dart';

class DetailBasicInformation extends StatelessWidget {
  final GeneralData generalData;

  const DetailBasicInformation(this.generalData, {super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final newDate = DateFormat('dd/MM/yyyy').parse(generalData.feNacimiento);
    String years = (now.difference(newDate).inDays ~/ 365).toString();

    return Container(
        width: double.maxFinite,
        //height: 100,
        //color: Colors.red,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 4, top: 4),
              color: Colors.red,
              width: double.maxFinite,
              child: const Text(
                textAlign: TextAlign.left,
                "INFORMACIÓN BÁSICA",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text("DNI:"),
            Text(
              textAlign: TextAlign.justify,
              generalData.numeroDocumento,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Apellido Paterno:"),
            Text(
              textAlign: TextAlign.justify,
              generalData.apellidoPaterno,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Apellido Materno:"),
            Text(
              generalData.apellidoMaterno,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("Nombres:"),
            Text(
              generalData.nombres,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("Fecha de Nacimiento:"),
            Text(
              "${generalData.feNacimiento} . $years años",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
