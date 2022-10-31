import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            leading: Icon(Icons.menu),
            actions: [
              Icon(Icons.usb_rounded),
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
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Lista de candidatos segun nombres'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }

  Future getCandidatos() async {}
}
