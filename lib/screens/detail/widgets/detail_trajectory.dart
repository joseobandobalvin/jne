import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/models/elective_position.dart';
import 'package:jne/models/partial_position.dart';
import 'package:jne/models/trajectory.dart';
import 'package:jne/screens/detail/widgets/card_trajectory.dart';

class DetailTrajectory extends StatelessWidget {
  final Trajectory trajectory;
  const DetailTrajectory(this.trajectory, {super.key});

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
            const Icon(Icons.groups_outlined),
            Text(
              ' Trayectoria partidaria (${trajectory.cargoPartidario.length + trajectory.cargoEleccion.length})',
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Container(
              color: Colors.teal,
              child: const Center(
                  child: Text(
                "CARGO PARTIDARIO",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            PartialPos(trajectory.cargoPartidario),
            Container(
              color: Colors.teal,
              child: const Center(
                  child: Text(
                "CARGO ELECCIÓN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            ElectionPos(trajectory.cargoEleccion),
          ],
        ),
      ),
    );
  }
}

class PartialPos extends StatelessWidget {
  final List<PartialPosition> data;
  const PartialPos(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            height: 140,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //height: 100,
                    width: 370,
                    //width: double.maxFinite,
                    color: Colors.deepPurple,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${data[index].anioCargoPartiDesde} - ${data[index].anioCargoPartiHasta}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${data[index].orgPolCargoPartidario}",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${data[index].cargoPartidario}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra cargos partidarios"),
          );
  }
}

class ElectionPos extends StatelessWidget {
  final List<ElectivePosition> data;
  const ElectionPos(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            height: 140,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //height: 100,
                    width: 370,
                    //width: double.maxFinite,
                    color: Colors.amberAccent,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${data[index].anioCargoElecDesde} - ${data[index].anioCargoElecHasta}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${data[index].orgPolCargoElec}",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${data[index].cargoEleccion}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra cargos de elección"),
          );
  }
}
