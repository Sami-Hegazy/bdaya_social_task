import 'package:bdaya_social_task/features/home/bottomIconScreen/accountBottomIconScreen.dart';
import 'package:bdaya_social_task/features/home/bottomIconScreen/homeBottomIconScreen.dart';
import 'package:bdaya_social_task/features/home/bottomIconScreen/likeBottomIconScreen.dart';
import 'package:bdaya_social_task/features/home/bottomIconScreen/plusBottomIconScreen.dart';
import 'package:bdaya_social_task/features/home/bottomIconScreen/searchBottomIconScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentTab = 0;

  List<Widget> page = [];
  var _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = const HomeBottomIconScreen();

    page = [
      const HomeBottomIconScreen(),
      SearchBottomIconScreen(),
      PlusBottomIconScreen(),
      const LikeBottomIconScreen(),
      AccountBottomIconScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontSize: 0.0);

    var bottomItems = BottomNavigationBar(
      currentIndex: _currentTab,
      onTap: (int index) {
        setState(() {
          _currentTab = index;
          _currentPage = page[index];
        });
      },
      type: BottomNavigationBarType.fixed,
      iconSize: 30.0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
          // label: Text("", style: textStyle),
          label: "",

          activeIcon: Icon(
            Icons.home,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          label: '',
          activeIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_box,
            color: Colors.grey,
          ),
          label: '',
          activeIcon: Icon(
            Icons.add_box,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Colors.grey,
          ),
          label: '',
          activeIcon: Icon(
            Icons.favorite,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            color: Colors.grey,
          ),
          label: '',
          activeIcon: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
        ),
      ],
    );

    return MaterialApp(
      home: Scaffold(bottomNavigationBar: bottomItems, body: _currentPage),
    );
  }
}
