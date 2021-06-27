import 'package:flutter/material.dart';

class UpdatePasswordScreen extends StatefulWidget {
  @override
  _UpdatePasswordScreen createState() => new _UpdatePasswordScreen();
}

class _UpdatePasswordScreen extends State<UpdatePasswordScreen> {
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
          padding: EdgeInsets.only(bottom: 50, top: 50, left: 30, right: 30),
          child: new Column(children: <Widget>[
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "old password",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                enabledBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "new password",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                enabledBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "confirm password",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                enabledBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:  ElevatedButton(
                  child: Text(
                    'Save changes',
                  ),
                  style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () {},
                ) ),
          ]),
        ));
  }
}
