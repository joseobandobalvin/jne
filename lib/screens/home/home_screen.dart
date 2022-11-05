import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/models/user.dart';

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
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            leading: Icon(Icons.menu),
            actions: [
              Icon(
                Icons.search_rounded,
                size: 23,
              ),
            ],
            title: Text("JNE"),
            //pinned: false,
            snap: true,
            floating: true,
            expandedHeight: 60.0,
            // flexibleSpace: FlexibleSpaceBar(
            //   title: Text('SliverAppBar'),
            // ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 100,
                  color: Colors.deepPurpleAccent[700],
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: usuarios,
            builder: (context, snapshot) {
              var childCount = 0;
              if (snapshot.connectionState != ConnectionState.done) {
                childCount = 0;
              } else {
                childCount = snapshot.data!.length;
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    var idHojaVida = snapshot.data![index].idHojaVida.toInt();

                    return Card(
                      margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      //color: Colors.black12,
                      child: ListTile(
                        leading: CachedNetworkImage(
                          imageUrl:
                              "https://declara.jne.gob.pe/Assets/Fotos-HojaVida/$idHojaVida.jpg",
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        title: Text(snapshot.data![index].nombreCompleto,
                            style: const TextStyle(color: Colors.blue)),
                        subtitle: Text(snapshot.data![index]
                            .organizacionPolitica), //todo set your data from response
                      ),
                    );
                    // return Container(
                    //   color: index.isOdd ? Colors.white : Colors.black12,
                    //   height: 100.0,
                    //   child: Center(
                    //     child: Text(
                    //       snapshot.data![index].nombreCompleto,
                    //     ),
                    //   ),
                    // );
                  },
                  childCount: childCount,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
