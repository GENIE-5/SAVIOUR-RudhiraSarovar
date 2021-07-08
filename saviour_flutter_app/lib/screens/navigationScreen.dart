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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Vinay Kohli"),
              accountEmail: Text("vinaykohli@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/474x/5b/ba/76/5bba763062eedbb628779215a24848b1.jpg'),
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
          title: Text("request"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RequestScreen();
            }));
          },
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
              onTap: (){
                RequestHandler().getDonorsDataFromPincode(pincode: "505462");
              },
            ),
      ],
    );
  }
}
