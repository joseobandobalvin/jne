import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jne/models/cv.dart';
import 'package:jne/screens/detail/detail_screen.dart';

class SearchResultList extends StatelessWidget {
  final Cv usuario;
  const SearchResultList(this.usuario, {super.key});

  @override
  Widget build(BuildContext context) {
    var idOrgPol = usuario.idOrganizacionPolitica.toInt();
    return ListTile(
      leading: CachedNetworkImage(
        width: 47,
        height: 47,
        imageUrl:
            "https://aplicaciones007.jne.gob.pe/srop_publico/Consulta/Simbolo/GetSimbolo/$idOrgPol",
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            LinearProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      title: Text(
        //textAlign: TextAlign.justify,
        maxLines: 2,
        usuario.nombreCompleto,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        usuario.organizacionPolitica,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
      onTap: () => Get.to(() => DetailScreen(), arguments: usuario),
    );
  }
}
