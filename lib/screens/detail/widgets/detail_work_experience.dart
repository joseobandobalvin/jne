import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:jne/configs/themes/app_colors.dart';

class DetailWorkExperience extends StatelessWidget {
  const DetailWorkExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: 40.0,
        color: kDarkBlue,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.centerLeft,
        child: const Text(
          'Experiencia laboral',
          style: TextStyle(color: Colors.white),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => ListTile(
            leading: const CircleAvatar(
              child: Text('0'),
            ),
            title: Text('List tile #$i'),
          ),
          childCount: 20,
        ),
      ),
    );
  }
}
