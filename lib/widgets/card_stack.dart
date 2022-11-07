import 'package:flutter/material.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/models/user.dart';

class CardStack extends StatelessWidget {
  final User usuario;
  const CardStack(this.usuario, {super.key});

  @override
  Widget build(BuildContext context) {
    var darkCardWidth = MediaQuery.of(context).size.width - 2 * 8;

    return Center(
      //padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
            color: kDarkBlue,
            child: Container(
              width: darkCardWidth,
              height: 140,
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 100,
              ),
              child: Center(
                child: Text(
                  usuario.nombreCompleto,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
          ),
          Positioned(
            top: null,
            bottom: 0,
            left: (0.1 * darkCardWidth),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              color: kLightBlue,
              child: Container(
                width: darkCardWidth * 0.8,
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Center(
                  child: Text(
                    usuario.organizacionPolitica,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
