import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 125,
            child: DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color(0xff000000),
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.75), BlendMode.dstATop),
                    image: new NetworkImage(
                      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fparissecret.com%2Fwp-content%2Fuploads%2F2018%2F02%2Fhistoire19.jpg&f=1&nofb=1',
                    ),
                  ),
                ),
                child: Text('Application movie',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24))),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home, color: Colors.indigo),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person, color: Colors.indigo),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
    );
  }
}
