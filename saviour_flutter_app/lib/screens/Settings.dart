import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:custom_switch/custom_switch.dart';
import 'package:saviour_flutter_app/screens/updateEmailScreen.dart';
import 'package:saviour_flutter_app/screens/updatePassswordScreen.dart';
import 'package:saviour_flutter_app/screens/updateUsernameScreen.dart';
import 'package:saviour_flutter_app/screens/updateNumberScreen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreen createState() => new _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  Widget build(BuildContext context) {
   // var screenSize = MediaQuery.of(context).size;

    //bool _switchNotificationsOff = false;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white),
        title: Text(
          "SETTINGS",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              color: Colors.red,
              iconSize: 100,
              onPressed: () {},
            ),
            Text("Change profile picture",
                style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                )),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.account_box,
                color: Colors.white,
                size: 40,
              ),
              title: Text("Edit username",
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  )),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UpdateUsernameScreen();
                }));
              },
            ),
            SizedBox(
              height: 10,
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.notifications,
            //     color: Colors.white,
            //     size: 40,
            //   ),
            //   title: Text("Notifications",
            //       style: new TextStyle(
            //         fontSize: 20.0,
            //         color: Colors.white,
            //       )),
            //   trailing: CustomSwitch(
            //     activeColor: Colors.grey,
            //     value: _switchNotificationsOff,
            //     onChanged: (value) {
            //       print("VALUE : $value");
            //       setState(() {
            //         _switchNotificationsOff = value;
            //       });
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            ListTile(
              leading: Icon(
                Icons.lock_outline,
                color: Colors.white,
                size: 40,
              ),
              title: Text("Change Password",
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  )),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UpdatePasswordScreen();
                }));
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.mail_outline,
                color: Colors.white,
                size: 40,
              ),
              title: Text("Change Mail ID",
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  )),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UpdateEmailScreen();
                }));
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.call,
                color: Colors.white,
                size: 40,
              ),
              title: Text("Change Phone Number",
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  )),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UpdateNumberScreen();
                }));
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(
                  child: Text('Save changes'),
                   style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () {},
                )),
          ],
        ),
      ),
    );
  }
}
