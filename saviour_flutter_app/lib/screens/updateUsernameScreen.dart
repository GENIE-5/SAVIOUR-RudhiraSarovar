import 'package:flutter/material.dart';
import 'package:saviour_flutter_app/screens/databasemanagement.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UpdateUsernameScreen extends StatefulWidget {
  @override
  _UpdateUsernameScreen createState() => new _UpdateUsernameScreen();
}

class _UpdateUsernameScreen extends State<UpdateUsernameScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController newUserNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DataBaseManager db = new DataBaseManager();
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
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
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
                controller: userNameController,
                validator: (value) {
                  if (value!.isEmpty) return "Required";
                  return null;
                },
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
                    onPressed: () {
                      if (_formKey.currentState!.validate() == true) {
                        db.UpdateAuthUserName(userNameController.text
                            //"Akash"
                            );
                        db.UpdateField("username", userNameController.text);
                        Alert(
                          context: context,
                          title: 'Success',
                          desc: "your password chnaged successfully",
                        ).show();
                      }
                    },
                  )),
            ]),
          ),
        ));
  }
}
