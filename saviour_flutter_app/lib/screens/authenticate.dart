import 'package:firebase_auth/firebase_auth.dart';
import 'package:saviour_flutter_app/models/user.dart';
import 'package:saviour_flutter_app/screens/databasemanagement.dart';



class AuthService {
//Registeration of new user using email and password
 
Future<bool> registerWithEmailAndPass(registerEmail,registerPassword,registerUsername,bloodGroup,pincode,age,mobileNumber) async{

  try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: registerEmail,
    password: registerPassword
  );

 await userCredential.user!.updateDisplayName(registerUsername);

  print(userCredential);


OurUser currentUserData=OurUser(uid: userCredential.user!.uid , username: registerUsername, age: age, phoneNumber:mobileNumber, pincode: pincode,profilePicUrl: "");

DataBaseManager().insertDataIntoDatabase(currentUserData);
DataBaseManager().insertData(uid:userCredential.user!.uid ,pincode: pincode );

return true;

} on 
FirebaseAuthException
 catch (e)
 {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
    return false;
  }
   else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
    return false;
  }



//Login of a user using email and password
 
  Future<bool> signInWithEmailAndPassword(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      print(userCredential.user!.email);

      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }
 
}
