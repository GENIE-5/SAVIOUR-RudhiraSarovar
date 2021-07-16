import 'package:flutter/material.dart';
import 'package:saviour_flutter_app/screens/databasemanagement.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UpdateEmailScreen extends StatefulWidget {
  @override
  _UpdateEmailScreen createState() => new _UpdateEmailScreen();
}

class _UpdateEmailScreen extends State<UpdateEmailScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();
  DataBaseManager db = new DataBaseManager();
  final _formKey = GlobalKey<FormState>();
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
                  labelText: "old email id",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  enabledBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                  ),
                ),
                controller: emailController,
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
                  labelText: "new email id",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  enabledBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                  ),
                ),
                controller: newEmailController,
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
                      if (_formKey.currentState!.validate() == true) {
                        if (db.getAuthUser().email != emailController.text) {
                          Alert(
                            context: context,
                            title: 'Error',
                            desc: "your email didn't match",
                          ).show();
                        } else {
                          db.UpdateAuthField(emailController.text);
                          Alert(
                            context: context,
                            title: 'Success',
                            desc: "your email chnaged successfully",
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
