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

  Future<List<Cv>> _search() async {
    var cv = _homeController.getCandidatesByName(query);
    return cv;
  }

  // To clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
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
          return ListView.builder(
            itemBuilder: (context, index) {
              return SearchResultList(snapshot.data![index]);
            },
            itemCount: snapshot.data!.length,
          );
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
}
