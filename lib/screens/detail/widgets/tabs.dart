import 'package:flutter/material.dart';
import 'package:jne/configs/themes/app_colors.dart';

class TwitterTabs extends SliverPersistentHeaderDelegate {
  final double size;

  TwitterTabs(this.size);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: kDarkBlue,
      height: size,
      child: const TabBar(
        isScrollable: true,
        tabs: <Widget>[
          Tab(
            text: "Información básica",
          ),
          Tab(
            text: "Experiencia laboral",
          ),
          Tab(
            text: "Formación academica",
          ),
          Tab(
            text: "trayectoria",
          ),
          Tab(
            text: "Renuncia efectuada",
          ),
          Tab(
            text: "Informacion adicional",
          ),
          Tab(
            text: "Declaracion jurada",
          ),
          Tab(
            text: "Sentencia penal",
          ),
          Tab(
            text: "Sentencia obliga",
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => size;

  @override
  double get minExtent => size;

  @override
  bool shouldRebuild(TwitterTabs oldDelegate) {
    return oldDelegate.size != size;
  }
}
