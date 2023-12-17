import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jne/configs/themes/app_colors.dart';
import 'package:jne/controllers/home_controller.dart';
import 'package:jne/generated/l10n.dart';
import 'package:jne/models/cv.dart';
import 'package:jne/models/user.dart';
import 'package:jne/screens/detail/page1.dart';
import 'package:jne/screens/detail/widgets/detail_basic_information.dart';

// class DetailScreenEx extends StatefulWidget {
//   const DetailScreenEx({super.key});

//   @override
//   State<DetailScreenEx> createState() => _DetailScreenExState();
// }

// class _DetailScreenExState extends State<DetailScreenEx> {
//   final Cv cv = Get.arguments;
//   late Future<User> res;
//   final HomeController _homeController = HomeController();

//   @override
//   void initState() {
//     res = _homeController.getUserInformation(cv.idHojaVida.toInt());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var idHojaVida = cv.idHojaVida.toInt();
//     var idOrgPol = cv.idOrganizacionPolitica.toInt();

//     return Scaffold(
//       body: DefaultTabController(
//         length: 5,
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               backgroundColor: kDarkBlue,
//               title: Text(cv.nombreCompleto),
//               expandedHeight: 60.0,
//               elevation: 10.0,
//               pinned: true,
//             ),
//             SliverToBoxAdapter(
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(10),
//                     width: double.maxFinite,
//                     child: Text(
//                       textAlign: TextAlign.center,
//                       cv.organizacionPolitica,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(bottom: 4.0),
//                     height: 130,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Image.network(
//                             "${S.current.urlPhotoResume}/$idHojaVida.jpg",
//                           ),
//                         ),
//                         Expanded(
//                           child: Image.network(
//                             "${S.current.urlPoliticalGroupSymbol}/$idOrgPol",
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SliverAppBar(
//               pinned: true,
//               automaticallyImplyLeading: false,
//               primary: false,
//               elevation: 8.0,
//               backgroundColor: Colors.deepPurple,
//               title: Align(
//                 alignment: AlignmentDirectional.center,
//                 child: TabBar(
//                   indicatorColor: Colors.white,
//                   indicatorWeight: 1.0,
//                   isScrollable: true,
//                   tabs: [
//                     Tab(text: "Información básica"),
//                     Tab(text: "Experiencia laboral"),
//                     Tab(text: "Formación académica"),
//                     Tab(text: "Trayectoria partidaria"),
//                     Tab(text: "Declaración jurada"),
//                   ],
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Container(
//                 color: Colors.blue,
//                 height: 200.0,
//                 child: Padding(
//                   padding: EdgeInsets.all(0.0),
//                   child: TabBarView(
//                     children: [
//                       Page1(),
//                       Text("Hola 2"),
//                       Text("Hola 3"),
//                       Text("Hola 4"),
//                       Text("Hola 4.1"),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DetailScreenEx extends StatelessWidget {
  final Cv cv = Get.arguments;
  DetailScreenEx({super.key});

  @override
  Widget build(BuildContext context) {
    var idHojaVida = cv.idHojaVida.toInt();
    var idOrgPol = cv.idOrganizacionPolitica.toInt();
    final List<String> tabs = <String>[
      'Información básica',
      'Experiencia laboral',
      'Formación académica',
      'Trayectoria partidaria',
      //'Declaración jurada'
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: kDarkBlue,
                  title: Text(cv.nombreCompleto),
                  pinned: true,
                  expandedHeight: 290,
                  //elevation: 10.0,
                  forceElevated: innerBoxIsScrolled,

                  bottom: TabBar(
                    isScrollable: true,
                    tabs: tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          sliver: SliverFixedExtentList(
                            itemExtent: 48.0,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return ListTile(
                                  title: Text('Item $index'),
                                );
                              },
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
        //physics: const NeverScrollableScrollPhysics(),
        // headerSliverBuilder: (context, isScolled) {
        //   return [
        //     SliverAppBar(
        //       backgroundColor: kDarkBlue,
        //       title: Text(cv.nombreCompleto),
        //       collapsedHeight: 232,
        //       expandedHeight: 232,
        //       elevation: 10.0,
        //       flexibleSpace: Column(
        //         children: [
        //           const SizedBox(
        //             height: 60.0,
        //           ),
        //           Container(
        //             color: Colors.white,
        //             padding: const EdgeInsets.all(10),
        //             width: double.maxFinite,
        //             child: Text(
        //               textAlign: TextAlign.center,
        //               cv.organizacionPolitica,
        //               style: const TextStyle(
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ),
        //           Container(
        //             color: Colors.white,
        //             //margin: const EdgeInsets.only(bottom: 1.0),
        //             height: 133,
        //             child: Row(
        //               children: [
        //                 Expanded(
        //                   child: Image.network(
        //                     "${S.current.urlPhotoResume}/$idHojaVida.jpg",
        //                   ),
        //                 ),
        //                 Expanded(
        //                   child: Image.network(
        //                     "${S.current.urlPoliticalGroupSymbol}/$idOrgPol",
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     SliverPersistentHeader(
        //       delegate: MyDelegate(
        //         const TabBar(
        //           tabs: [
        //             Tab(text: "Información básica"),
        //             Tab(text: "Experiencia laboral"),
        //             Tab(text: "Formación académica"),
        //             Tab(text: "Trayectoria partidaria"),
        //             Tab(text: "Declaración jurada"),
        //           ],
        //           indicatorColor: Colors.black,
        //           unselectedLabelColor: Colors.grey,
        //           labelColor: Colors.white,
        //           isScrollable: true,
        //         ),
        //       ),
        //       floating: true,
        //       pinned: true,
        //     ),
        //   ];
        // },
        // body: TabBarView(
        //   children: [
        //     Page1(),
        //     Page1(),
        //     Page1(),
        //     Page1(),
        //     Page1(),
        //   ],
        // ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: kDarkBlue,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
