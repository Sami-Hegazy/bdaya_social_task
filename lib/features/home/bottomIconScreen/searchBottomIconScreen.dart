import 'package:flutter/material.dart';

class SearchBottomIconScreen extends StatefulWidget {
  const SearchBottomIconScreen({super.key});

  @override
  _SearchBottomIconScreenState createState() => _SearchBottomIconScreenState();
}

class _SearchBottomIconScreenState extends State<SearchBottomIconScreen> {
  @override
  Widget build(BuildContext context) {
    var appBar = Container(
//      color: Colors.white,
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                top: 12.0, left: 10.0, bottom: 11.0, right: 10.0),
            child: GestureDetector(
              child: const Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 25.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text("Search",
                        style: TextStyle(fontSize: 17.0, color: Colors.grey)),
                  )
                ],
              ),
              onTap: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2.0),
            height: 1.5,
            color: Colors.grey[300],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar:
          PreferredSize(preferredSize: const Size.square(100.0), child: appBar),
      body: Container(
        child: const Center(
          child: Text("Not yet implemented"),
        ),
      ),
    );
  }
}
