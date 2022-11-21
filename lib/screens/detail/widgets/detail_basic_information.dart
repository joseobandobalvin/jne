import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/models/general_data.dart';

class DetailBasicInformation extends StatelessWidget {
  final GeneralData generalData;
  const DetailBasicInformation(this.generalData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: 40.0,
        color: kDarkBlue,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.centerLeft,
        child: Row(
          children: const [
            Icon(Icons.info_outline),
            Text(
              ' Información basica',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Info(generalData),
            BirthPlace(generalData),
            Address(generalData),
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final GeneralData data;
  const Info(this.data, {super.key});
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final newDate = DateFormat('dd/MM/yyyy').parse(data.feNacimiento);
    String years = (now.difference(newDate).inDays ~/ 365).toString();
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.maxFinite,
      color: Colors.lightBlueAccent,
      child: Column(
        children: [
          const Text("DNI:"),
          Text(
            textAlign: TextAlign.justify,
            data.numeroDocumento,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Apellido Paterno:"),
          Text(
            textAlign: TextAlign.justify,
            data.apellidoPaterno,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Apellido Materno:"),
          Text(
            data.apellidoMaterno,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("Nombres:"),
          Text(
            data.nombres,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("Fecha de Nacimiento:"),
          Text(
            "${data.feNacimiento} . $years años",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class BirthPlace extends StatelessWidget {
  final GeneralData data;
  const BirthPlace(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.limeAccent,
      width: double.maxFinite,
      child: Column(
        children: [
          Text("Lugar de Nacimiento"),
          Text("Pais:"),
          Text(
            data.paisNacimiento,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Departamento:"),
          Text(
            data.naciDepartamento,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Provincia:"),
          Text(
            data.naciProvincia,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Distrito:"),
          Text(
            data.naciDistrito,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class Address extends StatelessWidget {
  final GeneralData data;
  const Address(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      width: double.maxFinite,
      child: Column(
        children: [
          Text("Lugar de Domicilio"),
          Text("Departamento:"),
          Text(
            data.domiDepartamento,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Provincia:"),
          Text(
            data.domiProvincia,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Distrito:"),
          Text(
            data.domiProvincia,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Dirección:"),
          Text(
            data.domicilioDirecc,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
