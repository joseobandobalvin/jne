import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/models/user.dart';
import 'package:jne/widgets/card_stack.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<User>> usuarios;
  final HomeController _homeController = HomeController();

  //var users = Get.arguments;

  @override
  void initState() {
    super.initState();
    usuarios = _homeController.getCandidates();
    //print(usuarios);
  }

  @override
  Widget build(BuildContext context) {
    var darkCardWidth = MediaQuery.of(context).size.width - 2 * 8;
    var darkCardHeight = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      backgroundColor: kLightBlue,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: kDarkBlue,
            leading: Icon(Icons.menu),
            actions: [
              Icon(
                Icons.search_rounded,
                size: 23,
              ),
            ],
            title: Text("Hojas de Vida"),
            //pinned: false,
            snap: true,
            floating: true,
            expandedHeight: 60.0,
            // flexibleSpace: FlexibleSpaceBar(
            //   title: Text('SliverAppBar'),
            // ),
          ),
          // SliverToBoxAdapter(
          //   child: CardStack(),
          // ),
          FutureBuilder(
            future: usuarios,
            builder: (context, snapshot) {
              var childCount = 0;

              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                //print(snapshot);
                childCount = snapshot.data!.length;
                //print("childCount tiene $childCount datos");
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      var idHojaVida = snapshot.data![index].idHojaVida.toInt();

                      return CardStack(snapshot.data![index]);
                      // return Card(
                      //   elevation: 10,
                      //   margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      //   child: ListTile(
                      //     leading: CachedNetworkImage(
                      //       imageUrl:
                      //           "https://declara.jne.gob.pe/Assets/Fotos-HojaVida/$idHojaVida.jpg",
                      //       progressIndicatorBuilder:
                      //           (context, url, downloadProgress) =>
                      //               CircularProgressIndicator(
                      //                   value: downloadProgress.progress),
                      //       errorWidget: (context, url, error) =>
                      //           const Icon(Icons.error),
                      //     ),
                      //     title: Text(snapshot.data![index].nombreCompleto,
                      //         style: const TextStyle(color: Colors.blue)),
                      //     subtitle:
                      //         Text(snapshot.data![index].organizacionPolitica),
                      //   ),
                      // );
                    },
                    childCount: childCount,
                  ),
                );
              }
              return const SliverToBoxAdapter(
                child: Center(
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.black45,
                    minHeight: 2,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
