import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/models/cv.dart';
import 'package:jne/widgets/card_stack.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Cv>> usuarios;
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
            elevation: 10.0,
            // flexibleSpace: FlexibleSpaceBar(
            //   title: Text('SliverAppBar'),
            // ),
          ),
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
                      return CardStack(snapshot.data![index]);
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
