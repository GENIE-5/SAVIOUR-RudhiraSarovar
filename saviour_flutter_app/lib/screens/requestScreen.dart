import 'package:flutter/material.dart';
import 'package:saviour_flutter_app/screens/donorsListScreen.dart';
import 'package:saviour_flutter_app/screens/home.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  var bloodGroupSelected = 'A+';
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController();
  TextEditingController bloodType = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _bloodGroups = ['O+', 'O-', 'A+', 'A-', 'AB+', 'AB-', 'B+', 'B-'];
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          },
        ),
        title: Text("Request Blood"),
        backgroundColor: Colors.brown[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Name",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Icon(
                              Icons.account_circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: deviceWidth * 0.25,
                            height: deviceHeight * 0.08,
                            // margin: EdgeInsets.only(left: deviceWidth * 0.1),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                accentColor: Colors.red,
                              ),
                              child: TextFormField(
                                // initialValue: "+91",
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    prefixIconConstraints: BoxConstraints(
                                        minWidth: 23, maxHeight: 20),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 5),
                                      child: Icon(Icons.flag),
                                    ),
                                    hintText: ("Code"),
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: deviceHeight * 0.015),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                                controller: phoneCodeController,
                                validator: (value) {
                                  if (value!.isEmpty)
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
                                    prefixIconConstraints: BoxConstraints(
                                        minWidth: 23, maxHeight: 20),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 5),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: deviceHeight * 0.01),
                                    border: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                                controller: phoneNumberController,
                                maxLength: 10,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return "Required";
                                  else
                                    return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Type',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: selectedRadio,
                            activeColor: Colors.red,
                            onChanged: (val) {
                              setSelectedRadio(val);
                            },
                          ),
                          Text('Blood'),
                          SizedBox(
                            width: 30.0,
                          ),
                          Radio(
                            value: 2,
                            groupValue: selectedRadio,
                            activeColor: Colors.red,
                            onChanged: (val) {
                              setSelectedRadio(val);
                            },
                          ),
                          Text('Platlets'),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Container(
                            // width: deviceWidth,
                            // margin: EdgeInsets.only(
                            //     left: deviceWidth * 0.1,
                            //     bottom: deviceHeight * 0.03),
                            child: Text(
                              'Blood Group',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Container(
                            
                            //color: Colors.blue,
                            child: DropdownButton<String>(
                              focusColor: Colors.black,
                              items:
                                  _bloodGroups.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(dropDownStringItem));
                              }).toList(),
                              onChanged: (newValueSelected) {
                                setState(() {
                                  this.bloodGroupSelected =
                                      newValueSelected.toString();
                                });
                              },
                              value: bloodGroupSelected,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          labelText: 'Hospital Name',
                          hintText: "Yashoda Hospital",
                          border: UnderlineInputBorder(),
                        ),
                        maxLines: 2,
                        controller: hospitalController,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'pin-code',
                          hintText: "234321",
                          border: UnderlineInputBorder(),
                        ),
                        controller: pincodeController,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          margin:EdgeInsets.only(left: 230),
                          child: ElevatedButton(
                          
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => donorsList(
                                            pincode: pincodeController.text,
                                          )),
                                );
                              }
                            },
                            child: Text('Request')),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
