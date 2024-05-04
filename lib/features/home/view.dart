import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.controller,
  });

  static Widget hooked({
    BdayaGetItHookMode hookMode = BdayaGetItHookMode.lazySingleton,
    String? instanceName,
    Object? param1,
    Object? param2,
    List<Object?>? keys,
  }) {
    return HookBuilder(
      builder: (context) => HomeView(
        controller: useBdayaViewController(
          hookMode: hookMode,
          instanceName: instanceName,
          keys: keys,
          param1: param1,
          param2: param2,
        ),
      ),
    );
  }

  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: CustomScrollView(
  //       slivers: [
  //         Builder(builder: (context) {
  //           final categories =
  //               controller.categoriesService.categoriesListRx.of(context);
  //           return SliverToBoxAdapter(
  //             child: SizedBox(
  //               height: 200,
  //               child: ListView(
  //                 scrollDirection: Axis.horizontal,
  //                 children: categories
  //                     .map(
  //                       (e) => Container(
  //                         color: Colors.amber,
  //                         margin: const EdgeInsets.all(8),
  //                         width: 100,
  //                         height: 100,
  //                         child: Column(
  //                           key: Key(e.id),
  //                           children: [
  //                             Image.network(e.imageUrl),
  //                             Text(e.name),
  //                           ],
  //                         ),
  //                       ),
  //                     )
  //                     .toList(),
  //               ),
  //             ),
  //           );
  //         }),
  //         const SliverToBoxAdapter(
  //           child: Text('Categories'),
  //         ),
  //         SliverList.builder(
  //           itemCount: 10,
  //           itemBuilder: (context, index) {
  //             return ListTile(
  //               onTap: () {
  //                 context.goNamed(
  //                   AppRouteName.postDetails,
  //                   pathParameters: {'id': index.toString()},
  //                 );
  //               },
  //               title: Text('Category: $index'),
  //             );
  //           },
  //         ),
  //         const SliverToBoxAdapter(
  //           child: Text('Skin Type'),
  //         ),
  //         SliverList.builder(
  //           itemCount: 10,
  //           itemBuilder: (context, index) {
  //             return ListTile(
  //               title: Text('Skin Type: $index'),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
