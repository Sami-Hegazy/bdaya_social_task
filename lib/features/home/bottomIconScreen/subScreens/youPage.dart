import 'package:flutter/material.dart';

class YouPage extends StatefulWidget {
  const YouPage({super.key});

  @override
  _YouPageState createState() => _YouPageState();
}

class _YouPageState extends State<YouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/your_acc.png",
                      height: 50.0,
                    ),
                    Text("You start folloing Friend ${index + 1} "),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text("following"),
                    ),
                  ],
                ));
          }),
    );
  }
}
