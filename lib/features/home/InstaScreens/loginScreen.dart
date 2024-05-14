import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userId = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _textStyleBlack = const TextStyle(fontSize: 12.0, color: Colors.black);
  final _textStyleGrey = const TextStyle(fontSize: 12.0, color: Colors.grey);
  final _textStyleBlueGrey =
      const TextStyle(fontSize: 12.0, color: Colors.blueGrey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: _body(),
    );
  }

  Widget _userIDEditContainer() {
    return Container(
      child: TextField(
        controller: _userId,
        decoration: const InputDecoration(
            hintText: 'Phone number,email or username',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            isDense: true),
        style: _textStyleBlack,
      ),
    );
  }

  Widget _passwordEditContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: TextField(
        controller: _password,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            isDense: true),
        style: _textStyleBlack,
      ),
    );
  }

  Widget _loginContainer() {
    return GestureDetector(
      onTap: _login,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10.0),
        width: 500.0,
        height: 40.0,
        color: Colors.blue,
        child: const Text(
          "Log In",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _facebookContainer() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10.0),
      width: 500.0,
      height: 40.0,
      color: Colors.blue,
      child: GestureDetector(
        onTap: null,
        child: const Text(
          "Log in with facebook",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
        alignment: Alignment.center,
        height: 50.0,
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 1.0,
                  color: Colors.grey.withOpacity(0.7),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Dont have an account?', style: _textStyleGrey),
                      Text('Sign up.', style: _textStyleBlueGrey),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget _body() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
            child: Text(
              'Instagram',
              style: TextStyle(fontFamily: 'Billabong', fontSize: 50.0),
            ),
          ),
          _userIDEditContainer(),
          _passwordEditContainer(),
          _loginContainer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Forgot your login details?',
                style: _textStyleGrey,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Get help signing in.',
                  style: _textStyleBlueGrey,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 1.0,
                width: MediaQuery.of(context).size.width / 2.7,
                color: Colors.grey,
                child: const ListTile(),
              ),
              const Text(
                ' OR ',
                style: TextStyle(color: Colors.blueGrey),
              ),
              Container(
                height: 1.0,
                width: MediaQuery.of(context).size.width / 2.7,
                color: Colors.grey,
              ),
            ],
          ),
          _facebookContainer()
        ],
      ),
    );
  }

  void _login() {
    if (_userId.text.isEmpty) {
      _showEmptyDialog("Type something");
    } else if (_password.text.isEmpty) {
      _showEmptyDialog("Type something");
    } else {
      Navigator.of(context).pushReplacementNamed('/HomeScreen');
    }
  }

  _showEmptyDialog(String title) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: Text("$title can't be empty"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
