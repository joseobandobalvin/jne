import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/models/general_data.dart';
import 'package:jne/models/user.dart';
import 'package:jne/screens/detail/widgets/detail_basic_information.dart';

class DetailInformation extends StatelessWidget {
  final User user;

  const DetailInformation(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      // color: Colors.red,

      child: Container(
        //width: double.maxFinite,
        height: 700,
        child: DetailBasicInformation(user.datoGeneral),
      ),
    );

    // return SliverStickyHeader(
    //   header: Container(
    //     height: 40.0,
    //     color: kLightBlue,
    //     padding: EdgeInsets.symmetric(horizontal: 16.0),
    //     alignment: Alignment.centerLeft,
    //     child: const Text(
    //       'Header #0',
    //       style: TextStyle(color: Colors.white),
    //     ),
    //   ),
    //   sliver: SliverList(
    //     delegate: SliverChildBuilderDelegate(
    //       (context, i) => ListTile(
    //         leading: const CircleAvatar(
    //           child: Text('0'),
    //         ),
    //         title: Text('List tile #$i'),
    //       ),
    //       childCount: 2,
    //     ),
    //   ),
    // );

    // return SliverToBoxAdapter(
    //   //width: double.maxFinite,
    //   //height: 100,
    //   //color: Colors.red,
    //   child: Column(
    //     children: [
    //       // Container(
    //       //   padding: const EdgeInsets.all(10),
    //       //   margin: const EdgeInsets.only(bottom: 4, top: 4),
    //       //   color: Colors.red,
    //       //   width: double.maxFinite,
    //       //   child: const Text(
    //       //     textAlign: TextAlign.left,
    //       //     "INFORMACIÓN BÁSICA",
    //       //     style: TextStyle(
    //       //       fontWeight: FontWeight.bold,
    //       //     ),
    //       //   ),
    //       // ),
    //       const Text("DNI:"),
    //       Text(
    //         textAlign: TextAlign.justify,
    //         generalData.numeroDocumento,
    //         style: const TextStyle(
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       const Text("Apellido Paterno:"),
    //       Text(
    //         textAlign: TextAlign.justify,
    //         generalData.apellidoPaterno,
    //         style: const TextStyle(
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       const Text("Apellido Materno:"),
    //       Text(
    //         generalData.apellidoMaterno,
    //         style: const TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //       const Text("Nombres:"),
    //       Text(
    //         generalData.nombres,
    //         style: const TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //       const Text("Fecha de Nacimiento:"),
    //       Text(
    //         "${generalData.feNacimiento} . $years años",
    //         style: const TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //     ],
    //   ),
    // );
  }
}
