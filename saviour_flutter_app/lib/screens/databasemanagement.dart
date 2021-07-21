import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saviour_flutter_app/models/user.dart';

class DataBaseManager {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference developers =
      FirebaseFirestore.instance.collection('developers');

  // final CollectionReference developers =Firestore.instance.collection('');

//getting data from database using async and await
  Future getDataFromDB() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('developers').get();

      querySnapshot.docs.forEach((element) {
        print(element['name'] + "-" + element['bloodgroup']);
      });
    } catch (err) {
      print(err.toString());
    }
  }

//getting data from database using then method
  dynamic getdata() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('developers')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((element) {
                print(element['name'] + "-" + element['bloodgroup']);
              })
            });

    dynamic currentUserFromDB;

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .get()
        .then((value) => {
              currentUserFromDB = OurUser(
                  age: value["age"],
                  pincode: value['pincode'],
                  phoneNumber: value['phoneNumber'],
                  username: value['username'],
                  uid: value['uid'],
                  profilePicUrl: value['profilePicUrl']),
              print(currentUserFromDB.username)
            });

    return currentUserFromDB;
  }

  dynamic getData(field) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    dynamic currentUserFromDB;

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .get()
        .then((value) => {
              // currentUserFromDB = OurUser(
              //     age: value["age"],
              //     pincode: value['pincode'],
              //     phoneNumber: value['phoneNumber'],
              //     username: value['username'],
              //     uid: value['uid'],
              //     profilePicUrl: value['profilePicUrl']),
              currentUserFromDB = value,
            });
    print(currentUserFromDB[field]);
    return currentUserFromDB[field];
  }

  dynamic getAuthUser() {
    dynamic user = FirebaseAuth.instance.currentUser;
    return user;
  }

  void profilePicUpdate(url) {
    dynamic userObj = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection("Users")
        .doc(userObj.uid)
        .update({"profilePicUrl": url}).then((result) {
      print("new USer true");
    }).catchError((onError) {
      print("onError");
    });
  }

  void UpdateField(fieldName, fieldValue) {
    dynamic userObj = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection("Users")
        .doc(userObj.uid)
        .update({fieldName: fieldValue}).then((result) {
      print("new USer true");
    }).catchError((onError) {
      print("onError");
    });
  }

  void UpdateAuthField(fieldValue) async {
    dynamic userObj = await FirebaseAuth.instance.currentUser;
    await userObj.updateEmail(fieldValue);
  }

  Future UpdateAuthUserName(fieldValue) async {
    print(fieldValue);
    if (fieldValue != null) {
      await FirebaseAuth.instance.currentUser!.updateDisplayName(fieldValue);
    }
    //print(FirebaseAuth.instance.currentUser!.displayName);
  }

  void UpdateAuthpassword(fieldValue) async {
    dynamic userObj = await FirebaseAuth.instance.currentUser;
    await userObj.updatePassword(fieldValue);
  }

//pushing data into database
  void insertDataIntoDatabase(userObj) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(userObj.uid)
        .set({
          "uid": userObj.uid,
          "username": userObj.username,
          "age": userObj.age,
          "phoneNumber": userObj.phoneNumber,
          "pincode": userObj.pincode,
          "profilePicUrl": ''
        })
        .then((value) => {print("User with id is inserted")})
        .catchError((onError) {
          print(onError);
        });
  }

  void insertData({uid, pincode}) {
//   DocumentReference<Map<String, dynamic>> pincodes =await FirebaseFirestore.instance.collection("UsersWithinPincodes").doc("505642");
//  print("Pincodes are $pincodes");

    FirebaseFirestore.instance
        .collection("UsersWithinPincodes")
        .doc(pincode)
        .set({
      "pincode": pincode,
      "users": FieldValue.arrayUnion([
        {"uid": uid}
      ])
    }, SetOptions(merge: true)).then((value) {
      print("Success");
    });
  }
}

class RequestHandler {
  Future getDonorsDataFromPincode({required pincode}) async {
    dynamic result = await FirebaseFirestore.instance
        .collection("UsersWithinPincodes")
        .doc(pincode)
        .get();
    print(result['users']);
    List users = [];
    for (var user in result['users']) {
      dynamic userDetails = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user['uid'])
          .get();
      OurUser userObj = OurUser(
          profilePicUrl: "",
          username: userDetails['username'],
          phoneNumber: userDetails['phoneNumber'],
          uid: userDetails['uid'],
          age: userDetails['age'],
          pincode: userDetails['pincode']);
      users.add(userObj);
    }
    if (users.length == 0) {
      print("users are not there in this pincode");
    } else {
      print(users);
    }
  }
}
