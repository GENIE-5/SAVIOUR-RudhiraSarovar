import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:saviour_flutter_app/screens/models/developermodel.dart';

//import 'package:firebase_core/firebase_core.dart';

class DataBaseManager {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference developers =
      FirebaseFirestore.instance.collection('developers');

  // final CollectionReference developers =Firestore.instance.collection('');

  Future getDataFromDB() async {
    try {} catch (err) {
      print(err.toString());
    }
  }

  void getdata() {
    FirebaseFirestore.instance
        .collection('developers')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((element) {
                print(element['name'] + "-" + element['bloodgroup']);
              })
            });
  }
}
