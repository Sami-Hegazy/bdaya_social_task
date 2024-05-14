import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeBottomIconScreen extends StatefulWidget {
  const HomeBottomIconScreen({super.key});

  @override
  _HomeBottomIconScreenState createState() => _HomeBottomIconScreenState();
}

class _HomeBottomIconScreenState extends State<HomeBottomIconScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        backgroundColor: Colors.white,
        bottom: _appBar(),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: _body(),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 40),
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.photo_camera),
                iconSize: 25.0,
                onPressed: () {},
              ),
              const Text(
                'Instagram',
                style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 30.0,
                    color: Colors.black),
              ),
              IconButton(
                icon: const Icon(Icons.near_me),
                iconSize: 25.0,
                onPressed: () {},
              ),
            ],
          ),
        ));
  }

  Widget _floatPic() {
    return Container(
      height: 100.0,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 21,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        (index == 0)
                            ? "assets/images/your_acc.png"
                            : "assets/images/friend_acc.png",
                        height: 60.0,
                      ),
                    ),
                    Text((index == 0) ? "You" : " Friend $index")
                  ],
                );
              },
            ),
          ),
          Container(
            height: 0.5,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }

  Widget _titleFriendAcc(int i) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/friend_acc.png",
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text("Friend $i"),
          ),
        ],
      ),
    );
  }

  Widget _listImage() {
    return Image.asset(
      "assets/images/images.jpeg",
      fit: BoxFit.cover,
    );
  }

  Widget _listBottom() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.favorite_border, size: 30.0),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Icon(Icons.receipt, size: 30.0),
              ),
              Icon(Icons.near_me, size: 30.0),
            ],
          ),
          Icon(
            Icons.bookmark_border,
            size: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _listBottomDate() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 5.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            child: const Text("852 Likes"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2.0),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "July 15",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _listView() {
    return Flexible(
        child: ListView.builder(
            itemCount: 21,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: (index == 0)
                    ? _floatPic()
                    : Container(
                        color: Colors.white,
                        height: 390.0,
                        child: Column(
                          children: <Widget>[
                            _titleFriendAcc(index),
                            _listImage(),
                            _listBottom(),
                            _listBottomDate()
                          ],
                        ),
                      ),
              );
            }));
  }

  Widget _body() {
    return Column(
      children: <Widget>[_listView()],
    );
  }
}
