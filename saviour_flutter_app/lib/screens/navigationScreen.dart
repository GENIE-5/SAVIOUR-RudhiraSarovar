import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saviour_flutter_app/screens/Settings.dart';
import 'package:saviour_flutter_app/screens/about.dart';

import 'package:saviour_flutter_app/screens/requestScreen.dart';

import 'package:saviour_flutter_app/screens/databasemanagement.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  Widget divider() {
    return Divider(
      color: Colors.black,
      height: 2.0,
    );
  }

  dynamic user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(user.displayName),
              accountEmail: Text(user.email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL == null
                    ? "https://tse2.mm.bing.net/th?id=OIP._3QPMJ7E-_rbllGOe7OeLgHaHa&pid=Api&P=0&w=300&h=300"
                    : user.photoURL),
                backgroundColor: Colors.redAccent[200],
              ),
            ),
          ],
        ),
        ListTile(
          title: Text("About"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AboutPage();
            }));
          },
        ),
        Divider(
          color: Colors.black,
          height: 2.0,
        ),
        ListTile(
          title: Text("Settings"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SettingsScreen();
            }));
          },
        ),
        Divider(
          color: Colors.black,
          height: 2.0,
        ),
        ListTile(
          title: Text("Request"),
          onTap: () {
            RequestHandler().getDonorsDataFromPincode(pincode: "505462");
          },
        ),
      ],
    );
  }
}
