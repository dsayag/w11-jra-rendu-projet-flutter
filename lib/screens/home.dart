import 'package:dwmgex/screens/drawer.dart';
import 'package:dwmgex/screens/carouselimages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title = 'Home'}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgets = <Widget>[
    CarouselImages(),
    SafeArea(
        child: GestureDetector(
      onTap: () => print('Click'),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
          Container(
            height: 80,
            width: 80,
            color: Colors.red,
          ),
        ],
      ),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                await _signOut();
                Navigator.pushNamed(context, "/login");
              }),
        ],
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: _widgets[_selectedIndex],
      ),
    );
  }
}

///////////////////////////////
// Fonction pour déconnecter //
///////////////////////////////

Future<void> _signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print(e);
  }
}
