import 'package:flutter/material.dart';
import 'package:jne/models/trajectory.dart';

class CardTrajectory extends StatelessWidget {
  final Trajectory trajectory;
  const CardTrajectory(this.trajectory, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          const Text(
            "NOMBRE DEL CENTRO DE PRESTACIÓN DEL SERVICIO O TRABAJO:",
          ),
          Text(
            "${trajectory}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "OFICIOS / OCUPACIONES / PROFESIONES:",
          ),
          Text(
            "${trajectory}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  color: Colors.blueAccent,
                  child: Text("${trajectory}"),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  color: Colors.yellow,
                  child: Text("${trajectory}"),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  color: Colors.red,
                  child: Text("${trajectory}"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
