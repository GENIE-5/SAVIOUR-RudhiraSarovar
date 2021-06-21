
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{


String registerEmail="";
String registerPassword="";
String registerUsername="";
//final FirebaseAuth _auth=FirebaseAuth.instance;


void setRegisterprocess(email,username,password){
  this.registerPassword=password;
  this.registerEmail=email;
  this.registerUsername=username;

  print("Set register email :"+this.registerEmail);

}

Future<bool> registerWithEmailAndPass() async{


  print("email in registration :"+this.registerEmail);
  try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: this.registerEmail,
    password: this.registerPassword
  );



  print(userCredential);
return true;

} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
    return false;
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
    return false;
  }
} catch (e) {
  print(e);
  return false;
}


return false;

}


Future<bool> signInWithEmailAndPassword(email,password) async{

try{

UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: email,
   password: password ); 

print(userCredential.user!.email);
print("sign is successful");

return true;

}on FirebaseAuthException catch(e){
  print(e.message);
  return false;
}

}



}


