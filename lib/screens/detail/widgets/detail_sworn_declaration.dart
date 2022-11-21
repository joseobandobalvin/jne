import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/models/income.dart';
import 'package:jne/models/sworn_declaration.dart';

class DetailSwornDeclaration extends StatelessWidget {
  final SwornDeclaration swornDeclaration;
  const DetailSwornDeclaration(this.swornDeclaration, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: 40.0,
        color: kDarkBlue,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.centerLeft,
        child: Row(
          children: const [
            Icon(Icons.groups_outlined),
            Text(
              ' Declaración jurada ',
              style: TextStyle(color: Colors.white),
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
                "INGRESOS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Incomes(swornDeclaration.ingreso),
            Container(
              color: Colors.teal,
              child: const Center(
                  child: Text(
                "BIEN INMUEBLE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            //ElectionPos(trajectory.cargoEleccion),
          ],
        ),
      ),
    );
  }
}

class Incomes extends StatelessWidget {
  final List<Income> data;
  const Incomes(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            height: 190,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //height: 100,
                    width: 300,

                    color: Colors.lightGreenAccent,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Año declarado : ${data[index].anioIngresos}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Table(
                          //border: TableBorder.,
                          columnWidths: const <int, TableColumnWidth>{
                            0: IntrinsicColumnWidth(),
                            1: FlexColumnWidth(),
                            //2: FixedColumnWidth(64),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "RemuBrutaPrivado :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    width: 32,
                                    child: Text(
                                      "${data[index].remuBrutaPrivado}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "RemuBrutaPublico :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].remuBrutaPublico}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "RentaIndividualPrivado :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].rentaIndividualPrivado}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "RentaIndividualPublico :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].rentaIndividualPublico}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "OtroIngresoPrivado :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].otroIngresoPrivado}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    "OtroIngresoPublico :",
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Container(
                                    child: Text(
                                      "${data[index].otroIngresoPublico}",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              children: <Widget>[
                                Container(),
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 4.0,
                                    bottom: 4.0,
                                    right: 4.0,
                                  ),
                                  child: Text(
                                    "S/. ${data[index].totalIngresos}",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra ingresos"),
          );
  }
}
