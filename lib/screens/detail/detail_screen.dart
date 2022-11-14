import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/models/cv.dart';
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
  late var res;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(cv.nombreCompleto),
        backgroundColor: kDarkBlue,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                //width: double.maxFinite,
                width: 130,
                height: 130,
                child: Image.network(
                    "https://declara.jne.gob.pe/Assets/Fotos-HojaVida/$idHojaVida.jpg"),
              ),
              Expanded(
                child: FutureBuilder(
                  future: res,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var gg = snapshot.data;
                      print(gg);

                      //print("childCount tiene $childCount datos");
                      return DetailBasicInformation();
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
              ),
            ],
          ),
          const Divider(),
        ],
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
