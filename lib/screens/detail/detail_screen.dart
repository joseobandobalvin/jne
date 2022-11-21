import 'package:flutter/material.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/models/cv.dart';
import 'package:jne/models/user.dart';
import 'package:jne/screens/detail/detail_information.dart';

import 'package:get/get.dart';
import 'package:jne/screens/detail/widgets/detail_academic_formation.dart';
import 'package:jne/screens/detail/widgets/detail_basic_information.dart';
import 'package:jne/screens/detail/widgets/detail_sworn_declaration.dart';
import 'package:jne/screens/detail/widgets/detail_trajectory.dart';
import 'package:jne/screens/detail/widgets/detail_work_experience.dart';
import 'package:jne/screens/detail/widgets/tabs.dart';
import 'package:sliver_tools/sliver_tools.dart';

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
    res = _homeController.getUserInformation(cv.idHojaVida.toInt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var idHojaVida = cv.idHojaVida.toInt();
    var idOrgPol = cv.idOrganizacionPolitica.toInt();

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(cv.nombreCompleto),
      //   backgroundColor: kDarkBlue,
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kDarkBlue,
            title: Text(cv.nombreCompleto),
            expandedHeight: 60.0,
            elevation: 10.0,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  //margin: const EdgeInsets.only(bottom: 4, top: 4),

                  width: double.maxFinite,
                  child: Text(
                    textAlign: TextAlign.center,
                    cv.organizacionPolitica,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 4.0),
                  height: 130,
                  child: Row(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: res,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return MultiSliver(
                  children: [
                    //DetailInformation(snapshot.data!),
                    DetailBasicInformation(snapshot.data!.datoGeneral),
                    DetailWorkExperience(snapshot.data!.experienciaLaboral),
                    DetailAcademicFormation(snapshot.data!.formacionAcademica),
                    DetailTrajectory(snapshot.data!.trayectoria),
                    DetailSwornDeclaration(snapshot.data!.declaracionJurada),
                  ],
                );
                //return DetailInformation(snapshot.data!);
              }
              return const SliverToBoxAdapter(
                child: Center(
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.black45,
                    minHeight: 2,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


// child: Column(
          //   children: [
          //     Container(
          //       padding: const EdgeInsets.all(10),
          //       //margin: const EdgeInsets.only(bottom: 4, top: 4),
          //       //color: Colors.red,
          //       width: double.maxFinite,
          //       child: Text(
          //         textAlign: TextAlign.center,
          //         cv.organizacionPolitica,
          //         style: const TextStyle(
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 130,
          //       child: Row(
          //         children: [
          //           Expanded(
          //             child: Image.network(
          //                 "https://declara.jne.gob.pe/Assets/Fotos-HojaVida/$idHojaVida.jpg"),
          //           ),
          //           Expanded(
          //             child: Image.network(
          //               "https://aplicaciones007.jne.gob.pe/srop_publico/Consulta/Simbolo/GetSimbolo/$idOrgPol",
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 4,
          //     ),
          //     FutureBuilder(
          //       future: res,
          //       builder: (context, snapshot) {
          //         if (snapshot.connectionState == ConnectionState.done) {
          //           return DetailBasicInformation(snapshot.data!.datoGeneral);
          //         }
          //         return const Center(
          //           child: LinearProgressIndicator(
          //             backgroundColor: Colors.white,
          //             color: Colors.black45,
          //             minHeight: 2,
          //           ),
          //         );
          //       },
          //     ),
          //   ],
          // ),