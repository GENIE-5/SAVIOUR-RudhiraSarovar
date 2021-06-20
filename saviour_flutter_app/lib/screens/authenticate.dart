
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviour_flutter_app/screens/home.dart';
import 'package:saviour_flutter_app/screens/signinscreen.dart';

class AuthService{

//final FirebaseAuth _auth=FirebaseAuth.instance;




Future<bool> registerWithEmailAndPass() async{
  try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: "vinaykohli@gmail.com",
    password: "viratkohli@123"
  );



  print(userCredential);
return true;

} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
  return false;
}


return false;

}


Future<bool> signInWithEmailAndPassword() async{

try{

UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: "vinaykohli@gmai.com", password: "viratkohli@123"); 

print(userCredential.user!.email);
print("sign is successful");

return true;

}on FirebaseAuthException catch(e){
  print(e.message);
  return false;
}

}



}


class FirstScreen extends StatefulWidget {
  const FirstScreen({ Key? key }) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {

final user=Provider.of(context);

if(user==null)
return SignInPage();

    print("user is "+user);

    return HomePage();

}
}