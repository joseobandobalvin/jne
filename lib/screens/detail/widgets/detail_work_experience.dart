import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/models/work_experience.dart';
import 'package:jne/screens/detail/widgets/card_work_experience.dart';

class DetailWorkExperience extends StatelessWidget {
  final List<WorkExperience> listWork;
  const DetailWorkExperience(this.listWork, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: 40.0,
        color: kDarkBlue,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            const Icon(Icons.work_history_outlined),
            Text(
              ' Experiencia laboral (${listWork.length})',
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      sliver: listWork.isNotEmpty
          ? SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return CardWorkExperience(listWork[index]);
                },
                childCount: listWork.length,
              ),
            )
          : SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: const Text("No registra experiencia laboral"),
              ),
            ),
    );
  }
}
