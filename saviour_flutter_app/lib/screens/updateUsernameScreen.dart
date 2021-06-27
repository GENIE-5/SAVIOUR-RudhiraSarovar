import 'package:flutter/material.dart';

class UpdateUsernameScreen extends StatefulWidget {
  @override
  _UpdateUsernameScreen createState() => new _UpdateUsernameScreen();
}

class _UpdateUsernameScreen extends State<UpdateUsernameScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.only(bottom: 70, top: 70, left: 30, right: 30),
          child: new Column(children: <Widget>[
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "give your new user name here",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                enabledBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                ),
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(
                  child: Text(
                    'Save changes',
                  ),
                  style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () {},
                )),
          ]),
        ));
  }
}
