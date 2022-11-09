import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/models/cv.dart';

import 'package:get/get.dart';
import 'package:jne/screens/detail/detail_screen.dart';

class CardStack extends StatelessWidget {
  final Cv usuario;
  const CardStack(this.usuario, {super.key});

  @override
  Widget build(BuildContext context) {
    var darkCardWidth = MediaQuery.of(context).size.width - 2 * 8;
    var idHojaVida = usuario.idHojaVida.toInt();
    return GestureDetector(
      onTap: () => Get.to(() => DetailScreen(), arguments: usuario),
      child: Center(
        //padding: const EdgeInsets.all(2.0),
        child: Stack(
          children: <Widget>[
            Card(
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(17.0),
              // ),
              color: kDarkBlue,
              child: Container(
                alignment: Alignment.center,
                width: darkCardWidth,
                height: 140,
                // padding: const EdgeInsets.only(
                //   top: 20,
                //   bottom: 100,
                // ),
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 140,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 90,
                            height: 90,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://declara.jne.gob.pe/Assets/Fotos-HojaVida/$idHojaVida.jpg",
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        //color: kDarkBlue,
                        child: Column(
                          children: [
                            Text(
                              maxLines: 2,
                              usuario.nombreCompleto,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Container(
                              width: 3.0,
                              height: 3.0,
                              //color: Colors.amber,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              usuario.postulaDepartamento!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11.0,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                  height: 47,
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Center(
                    child: Text(
                      usuario.organizacionPolitica,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11.0,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
