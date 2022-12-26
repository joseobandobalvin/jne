import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/controllers/search_controller.dart';
import 'package:jne/models/cv.dart';
import 'package:jne/screens/home/widgets/search_result_list.dart';
import 'package:jne/widgets/card_stack.dart';

class CustomSearchDelegate extends SearchDelegate {
  final HomeController _homeController = HomeController();

  //PreferredSizeWidget? buildBottom(BuildContext context) => ver();

  Future<List<Cv>> _search() async {
    var cv = _homeController.getCandidatesByName(query);
    return cv;
  }

  // To clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
      IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Filtrar por:"),
              content: Container(
                width: double.infinity,
                color: Colors.amber,
                child: Text("Mensage."),
              ),
              actions: [
                okButton,
              ],
            ),
          );
        },
        icon: const Icon(Icons.more_vert),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Cv>>(
      future: _search(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return SearchResultList(snapshot.data![index]);
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return const Center(child: Text("Sin resultados"));
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        //color: kLightBlue,
        );
  }

  ver() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 70),
      child: Container(
        height: 40,
        width: double.infinity,
        color: kDarkBlue,
        child: Text("Hola mola"),
      ),
    );
  }

  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {},
  );
}
