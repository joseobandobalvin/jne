import 'package:flutter/material.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/models/cv.dart';
import 'package:jne/widgets/card_stack_detail.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Cv user = Get.arguments;
  @override
  Widget build(BuildContext context) {
    var idHojaVida = user.idHojaVida.toInt();
    return Scaffold(
      appBar: AppBar(
        title: Text(user.nombreCompleto),
        backgroundColor: kDarkBlue,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              //color: Colors.red,
              width: double.maxFinite,
              height: 130,
              child: Image.network(
                  "https://declara.jne.gob.pe/Assets/Fotos-HojaVida/$idHojaVida.jpg"),
            ),
            const Divider(),
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
