import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountEmail: Text("4nubhav@gmail.com"),
              accountName: Text("Anubhav Maurya"),
              currentAccountPicture: CircleAvatar(),
            ),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.black),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.profile_circled, color: Colors.black),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.chevron_left_slash_chevron_right,
                color: Colors.black),
            title: Text(
              "Contact",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.envelope, color: Colors.black),
            title: Text(
              "Messages",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.info, color: Colors.black),
            title: Text(
              "Information",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
