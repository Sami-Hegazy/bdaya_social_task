import 'package:bdaya_social_task/features/home/bottomIconScreen/subScreens/followingPage.dart';
import 'package:bdaya_social_task/features/home/bottomIconScreen/subScreens/youPage.dart';
import 'package:flutter/material.dart';

class LikeBottomIconScreen extends StatefulWidget {
  const LikeBottomIconScreen({super.key});

  @override
  _LikeBottomIconScreenState createState() => _LikeBottomIconScreenState();
}

class _LikeBottomIconScreenState extends State<LikeBottomIconScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    var appBar = Container(
      padding: const EdgeInsets.only(top: 25.0),
      child: TabBar(
        tabs: const [
          Tab(
            child: Text(
              "Following",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            child: Text(
              "You",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
        indicatorColor: Colors.black,
        controller: tabController,
      ),
    );

    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.square(55.0), child: appBar),
          body: TabBarView(
            controller: tabController,
            children: [FollowingPage(), YouPage()],
          )),
    );
  }
}
