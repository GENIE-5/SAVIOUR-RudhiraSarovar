import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:saviour_flutter_app/screens/authenticate.dart';
import 'package:saviour_flutter_app/screens/signinscreen.dart';

class Register1Screen extends StatefulWidget {
  @override
  _Register1ScreenState createState() => _Register1ScreenState();
}

class _Register1ScreenState extends State<Register1Screen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 // TextEditingController _email = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  var bloodGroupSelected = 'A+';
String registerEmail='';
String registerPassword='';

Register1Screen(registerEmail,registerPassword){

}
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


            child: Form(
              child: Column(children: [
            
            
                  AppBar(
                    leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
                  ),
            
                  
                  Container(height: deviceHeight * 0.2),
            
                  //MobileNumber Field
            
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
                child: TextFormField(
                 // initialValue: "+91",
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
                  validator: (value){
                    if(value!.isEmpty)
                    return "Required";
                    else
                    return null;
                  },


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
                child: TextFormField(
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
                  validator: (value){
                    if(value!.isEmpty)
                    return "Required";
                    else
                    return null;
                  },


                ),
              ),
                      ),
                    ],
                  ),
                  Container(height: deviceHeight * 0.1),
            
                  //Blood Group Text
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
                  
                  //SignUp Button
                  
                  Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Container(
              width: deviceWidth * 0.4,
              child: ElevatedButton(
                child: Text("Sign Up"),
                onPressed: ()async {
                  print("registerEmail :"+registerEmail);
            
            
                 dynamic result = await AuthService().registerWithEmailAndPass();

                 if(result==true)
                 print("Registration Successful");
                 else
                 print("Registration Unsuccessful");
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                    
                  );
                },
              ),
                      )),
                ]),
            )));
  }
}
