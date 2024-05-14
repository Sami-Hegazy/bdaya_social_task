import 'package:flutter/material.dart';

class AccountBottomIconScreen extends StatefulWidget {
  const AccountBottomIconScreen({super.key});

  @override
  _AccountBottomIconScreenState createState() =>
      _AccountBottomIconScreenState();
}

class _AccountBottomIconScreenState extends State<AccountBottomIconScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(),
          _profile(),
          _centerButtons(),
          _displayImages()
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "UserName",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.update),
                      iconSize: 25.0,
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.person_add),
                      iconSize: 25.0,
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.format_list_bulleted),
                      iconSize: 25.0,
                      onPressed: () {}),
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 2.0),
            height: 1.5,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }

  Widget _post() {
    return GestureDetector(
      child: const Column(
        children: <Widget>[
          Text(
            "72",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.0),
            child: Text(
              "posts",
              style: TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _followers() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: GestureDetector(
        child: const Column(
          children: <Widget>[
            Text(
              "352",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.0),
              child: Text(
                "followers",
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _following() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: GestureDetector(
        child: const Column(
          children: <Widget>[
            Text(
              "580",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.0),
              child: Text(
                "following",
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _profile() {
    return Container(
      height: 150.0,
      margin: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/your_acc.png",
                    height: 100.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "DisplayName",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[_post(), _followers(), _following()],
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0))),
                        margin: const EdgeInsets.only(top: 7.0),
                        height: 30.0,
                        width: 200.0,
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: 0.5,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }

  Widget _centerButtons() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                  icon: const Icon(
                    Icons.grid_on,
                    size: 30.0,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(
                    Icons.crop_original,
                    size: 30.0,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(
                    Icons.perm_contact_calendar,
                    size: 30.0,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(
                    Icons.bookmark_border,
                    size: 30.0,
                  ),
                  onPressed: () {}),
            ],
          ),
          Container(
            height: 0.5,
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }

  Widget _displayImages() {
    return Flexible(
        child: Container(
      child: GridView.builder(
          itemCount: 16,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(2.0),
              color: Colors.grey,
              child: Image.asset("assets/images/pic$index.png"),
            );
          }),
    ));
  }
}
