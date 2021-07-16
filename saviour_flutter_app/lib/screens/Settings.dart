import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saviour_flutter_app/screens/databasemanagement.dart';
//import 'package:custom_switch/custom_switch.dart';
import 'package:saviour_flutter_app/screens/updateEmailScreen.dart';
import 'package:saviour_flutter_app/screens/updatePassswordScreen.dart';
import 'package:saviour_flutter_app/screens/updateUsernameScreen.dart';
import 'package:saviour_flutter_app/screens/updateNumberScreen.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreen createState() => new _SettingsScreen();
}

 

class _SettingsScreen extends State<SettingsScreen> {
  String? url;
  dynamic user = "User";
   @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  File? _pickedImage;
  DataBaseManager db = new DataBaseManager();
  void imageToStorage() async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('userImages')
        .child(user.displayName + '.jpg');
    await ref.putFile(_pickedImage!);
    url = await ref.getDownloadURL();
    user.updatePhotoURL(url);
    db.profilePicUpdate(url);
  }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.getImage(source: ImageSource.camera, imageQuality: 20);
    if (pickedImage != null) {
      final pickedImageFile = File(pickedImage.path);

      setState(() {
        _pickedImage = pickedImageFile;
      });
    }
    imageToStorage();
  }

   
  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final pickedImageFile = File(pickedImage.path);
      setState(() {
        _pickedImage = pickedImageFile;
      });
    }
    imageToStorage();
    Navigator.pop(context);
  }

  void _remove() {
    setState(() {
      //_pickedImage = null;
      user.updatePhotoURL("https://tse2.mm.bing.net/th?id=OIP._3QPMJ7E-_rbllGOe7OeLgHaHa&pid=Api&P=0&w=300&h=300");
    });
    Navigator.pop(context);
  }

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
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: CircleAvatar(
                    radius: 71,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.blueAccent,
                      backgroundImage: NetworkImage(
                    user.photoURL==null?"https://tse2.mm.bing.net/th?id=OIP._3QPMJ7E-_rbllGOe7OeLgHaHa&pid=Api&P=0&w=300&h=300":user.photoURL),
                    ),
                  ),
                ),
                Positioned(
                    top: 120,
                    left: 110,
                    child: RawMaterialButton(
                      elevation: 10,
                      fillColor: Colors.red,
                      child: Icon(Icons.add_a_photo),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Choose option',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    //color: ColorsConsts.gradiendLStart
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      InkWell(
                                        onTap: _pickImageCamera,
                                        splashColor: Colors.purpleAccent,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.camera,
                                                color: Colors.purpleAccent,
                                              ),
                                            ),
                                            Text(
                                              'Camera',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                // color: ColorsConsts.title
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: _pickImageGallery,
                                        splashColor: Colors.purpleAccent,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.image,
                                                color: Colors.purpleAccent,
                                              ),
                                            ),
                                            Text(
                                              'Gallery',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: _remove,
                                        splashColor: Colors.purpleAccent,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.remove_circle,
                                                color: Colors.red,
                                              ),
                                            ),
                                            Text(
                                              'Remove',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                    ))
              ],
            ),
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
