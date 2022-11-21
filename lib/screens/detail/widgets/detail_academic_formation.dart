import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/models/academic_formation.dart';
import 'package:jne/models/basic_education.dart';
import 'package:jne/models/posgrade_education.dart';
import 'package:jne/models/technical_education.dart';
import 'package:jne/models/university_education.dart';

class DetailAcademicFormation extends StatelessWidget {
  final AcademicFormation academicFormation;
  const DetailAcademicFormation(this.academicFormation, {super.key});

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
            const Icon(Icons.school_outlined),
            Text(
              ' Formación académica (${academicFormation.educacionTecnico.length + academicFormation.educacionUniversitaria.length + academicFormation.educacionPosgrado.length})',
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Basic(academicFormation.educacionBasica),
            Container(
              color: Colors.teal,
              child: const Center(
                  child: Text(
                "ESTUDIOS TECNICOS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Technical(academicFormation.educacionTecnico),
            Container(
              color: Colors.teal,
              child: const Center(
                  child: Text(
                "ESTUDIOS UNIVERSITARIOS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            University(academicFormation.educacionUniversitaria),
            Container(
              color: Colors.teal,
              child: const Center(
                  child: Text(
                "ESTUDIOS POSGRADO",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Posgrade(academicFormation.educacionPosgrado),
          ],
        ),
      ),
    );
  }
}

class Basic extends StatelessWidget {
  final BasicEducation data;
  const Basic(this.data, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.maxFinite,
      color: Colors.lightBlueAccent,
      child: Column(
        children: [
          const Text("¿CUENTA CON ESTUDIOS PRIMARIOS?"),
          Text(
            textAlign: TextAlign.justify,
            "${data.eduPrimaria}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("¿ESTUDIOS PRIMARIOS CONCLUIDOS?"),
          Text(
            textAlign: TextAlign.justify,
            "${data.concluidoEduPrimaria}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("¿CUENTA CON ESTUDIOS SECUNDARIOS?"),
          Text(
            textAlign: TextAlign.justify,
            "${data.eduSecundaria}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("¿ESTUDIOS SECUNDARIOS CONCLUIDOS?"),
          Text(
            textAlign: TextAlign.justify,
            "${data.concluidoEduSecundaria}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Technical extends StatelessWidget {
  final List<TechnicalEducation> data;
  const Technical(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            height: 200,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text("${data[index].carreraTecnico}"));
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra estudios tecnicos"),
          );
  }
}

class University extends StatelessWidget {
  final List<UniversityEducation> data;
  const University(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? SizedBox(
            height: 200,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //height: 100,
                    width: 370,
                    //width: double.maxFinite,
                    color: Colors.yellow,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              "${data[index].universidad}",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${data[index].carreraUni}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Año : ${data[index].anioBachiller}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("CONCLUIDOS"),
                                  Text(
                                    "${data[index].concluidoEduUni}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("EGRESADO"),
                                  Text(
                                    "${data[index].egresadoEduUni}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra estudios universitarios"),
          );
  }
}

class Posgrade extends StatelessWidget {
  final List<PosgradeEducation> data;
  const Posgrade(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            height: 200,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.red,
                    width: 370,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              "${data[index].txCenEstudioPosgrado}",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${data[index].txEspecialidadPosgrado}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${data[index].txAnioPosgrado}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("CONCLUIDOS"),
                                  Text(
                                    "${data[index].concluidoPosgrado}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("EGRESADO"),
                                  Text(
                                    "${data[index].egresadoPosgrado}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra estudios de Posgrado"),
          );
  }
}
