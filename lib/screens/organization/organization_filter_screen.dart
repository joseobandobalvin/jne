import 'package:flutter/material.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/widgets/global_widgets/custom_drawer.dart';

class OrganizationFilterScreen extends StatefulWidget {
  const OrganizationFilterScreen({super.key});

  @override
  State<OrganizationFilterScreen> createState() =>
      _OrganizationFilterScreenState();
}

class _OrganizationFilterScreenState extends State<OrganizationFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlue,
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: kDarkBlue,

            actions: <Widget>[
              IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.search),
              )
            ],
            title: const Text("Filtros"),
            //pinned: false,
            snap: true,
            floating: true,
            expandedHeight: 60.0,
            elevation: 10.0,
            // flexibleSpace: FlexibleSpaceBar(
            //   title: Text('SliverAppBar'),
            // ),
          ),
        ],
      ),
    );
  }
}
