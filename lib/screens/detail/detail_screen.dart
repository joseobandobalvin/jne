import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/models/cv.dart';
import 'package:jne/models/user.dart';
import 'package:jne/screens/detail/detail_basic_information.dart';
import 'package:jne/widgets/card_stack_detail.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Cv cv = Get.arguments;
  late Future<User> res;
  //late Future<List<Cv>> usuarios;
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    super.initState();

    res = _homeController.getUserInformation(cv.idHojaVida.toInt());
  }

  @override
  Widget build(BuildContext context) {
    var idHojaVida = cv.idHojaVida.toInt();
    var idOrgPol = cv.idOrganizacionPolitica.toInt();
    return Scaffold(
      appBar: AppBar(
        title: Text(cv.nombreCompleto),
        backgroundColor: kDarkBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 4, top: 4),
              //color: Colors.red,
              width: double.maxFinite,
              child: Text(
                textAlign: TextAlign.center,
                cv.organizacionPolitica,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 130,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                        "https://declara.jne.gob.pe/Assets/Fotos-HojaVida/$idHojaVida.jpg"),
                  ),
                  Expanded(
                    child: Image.network(
                      "https://aplicaciones007.jne.gob.pe/srop_publico/Consulta/Simbolo/GetSimbolo/$idOrgPol",
                    ),
                  ),
                  // Expanded(
                  //   child: FutureBuilder(
                  //     future: res,
                  //     builder: (context, snapshot) {
                  //       if (snapshot.connectionState == ConnectionState.done) {
                  //         return DetailBasicInformation(snapshot.data!.datoGeneral);
                  //       }
                  //       return const Center(
                  //         child: LinearProgressIndicator(
                  //           backgroundColor: Colors.white,
                  //           color: Colors.black45,
                  //           minHeight: 2,
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            FutureBuilder(
              future: res,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  //User user = User.fromJson(snapshot.data);
                  //print(snapshot.data!.datoGeneral.apellidoMaterno);
                  print(snapshot.data!.experienciaLaboral);
                  return DetailBasicInformation(snapshot.data!.datoGeneral);
                }
                return const Center(
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.black45,
                    minHeight: 2,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class DetailScreen extends StatelessWidget {
//   final User user = Get.arguments;
//   DetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //print(user.nombreCompleto);
    
//   }
// }
