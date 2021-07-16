import 'package:flutter/material.dart';
import 'package:saviour_flutter_app/screens/databasemanagement.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UpdateNumberScreen extends StatefulWidget {
  @override
  _UpdateNumberScreen createState() => new _UpdateNumberScreen();
}

class _UpdateNumberScreen extends State<UpdateNumberScreen> {
  DataBaseManager db = new DataBaseManager();
  TextEditingController oldPhoneNumController = TextEditingController();
  TextEditingController newPhoneNumController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
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
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: new Column(children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "old number",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  enabledBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                  ),
                ),
                controller: oldPhoneNumController,
                validator: (value) {
                  if (value!.isEmpty) return "Required";
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "new number",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  enabledBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                  ),
                ),
                controller: newPhoneNumController,
                validator: (value) {
                  if (value!.isEmpty) return "Required";
                  return null;
                },
              ),
              SizedBox(
                height: 40,
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
                      print("my:"+ oldPhoneNumController.text);
                      if (_formKey.currentState!.validate() == true) {
                        if (db.getData("phoneNumber") !=
                            oldPhoneNumController.text) {
                          Alert(
                            context: context,
                            title: 'Error',
                            desc: "your phoneNumber didn't match",
                          ).show();
                        } else {
                          db.UpdateField(
                              "phoneNumber", newPhoneNumController.text);
                          Alert(
                            context: context,
                            title: 'Success',
                            desc: "your phoneNumber chnaged successfully",
                          ).show();
                        }
                      }
                    },
                  )),
            ]),
          ),
        ));
  }
}
