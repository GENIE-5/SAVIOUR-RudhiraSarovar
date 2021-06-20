import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:saviour_flutter_app/screens/authenticate.dart';

class Register1Screen extends StatefulWidget {
  @override
  _Register1ScreenState createState() => _Register1ScreenState();
}

class _Register1ScreenState extends State<Register1Screen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //TextEditingController _email = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  var bloodGroupSelected = 'B+';
  @override
  Widget build(BuildContext context) {
    var _bloodGroups = [
      'O+',
      'O-',
      'A+',
      'A-',
      'AB+',
      'AB-',
      'B+',
      'B-',
      'Dont know'
    ];

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      Container(height: deviceHeight * 0.2),
      Container(
        width: deviceWidth,
        margin: EdgeInsets.only(
            left: deviceWidth * 0.3, bottom: deviceHeight * 0.03),
        child: Text(
          'Mobile Number',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        children: [
          Container(
            width: deviceWidth * 0.25,
            height: deviceHeight * 0.08,
            margin: EdgeInsets.only(left: deviceWidth * 0.1),
            child: Theme(
              data: Theme.of(context).copyWith(
                accentColor: Colors.red,
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 23, maxHeight: 20),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 5),
                      child: Icon(Icons.flag),
                    ),
                    hintText: ("Code"),
                    hintStyle: TextStyle(
                        color: Colors.grey, fontSize: deviceHeight * 0.015),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                controller: phoneCodeController,
              ),
            ),
          ),
          Container(
            width: deviceWidth * 0.45,
            height: deviceHeight * 0.08,
            margin: EdgeInsets.only(left: deviceWidth * 0.1),
            child: Theme(
              data: Theme.of(context).copyWith(
                accentColor: Colors.red,
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 23, maxHeight: 20),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 5),
                    ),
                    hintStyle: TextStyle(
                        color: Colors.grey, fontSize: deviceHeight * 0.01),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                controller: phoneNumberController,
              ),
            ),
          ),
        ],
      ),
      Container(height: deviceHeight * 0.1),
      Container(
        width: deviceWidth,
        margin: EdgeInsets.only(
            left: deviceWidth * 0.3, bottom: deviceHeight * 0.03),
        child: Text(
          'Your Blood Group',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      DropdownButton<String>(
        items: _bloodGroups.map((String dropDownStringItem) {
          return DropdownMenuItem<String>(
              value: dropDownStringItem, child: Text(dropDownStringItem));
        }).toList(),
        onChanged: (newValueSelected) {
          setState(() {
            this.bloodGroupSelected = newValueSelected.toString();
          });
        },
        value: bloodGroupSelected,
      ),
      Container(
          padding: EdgeInsets.only(top: 25),
          child: Container(
            width: deviceWidth * 0.4,
            child: ElevatedButton(
              child: Text("Sign Up"),
              onPressed: () {

                AuthService().registerWithEmailAndPass();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register1Screen()),
                );
              },
            ),
          )),
    ])));
  }
}
