
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saviour_flutter_app/screens/authenticate.dart';
//import 'package:provider/provider.dart';
//import 'package:saviour_flutter_app/screens/databasemanagement.dart';
import 'package:saviour_flutter_app/screens/home.dart';
import 'package:saviour_flutter_app/screens/registration.dart';
//import 'package:form_validator/form_validator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

String email="";
String text="";
String password="";
String errstring="";
final _formKey=GlobalKey<FormState>();

//final builder=ValidationBuilder(locale: locale);

  @override
  Widget build(BuildContext context) {

    if(FirebaseAuth.instance.currentUser!=null){

      print(FirebaseAuth.instance.currentUser);
      return HomePage();
    }





    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("SignUp"),
        backgroundColor: Colors.redAccent[200],
      ),
     body:SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Padding(
             padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
             child: Form(
               autovalidateMode: AutovalidateMode.always, key: _formKey,
               child: 
             Column(
                children: [
                  
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Icon(
                          Icons.account_circle,
                        ),
                      ),
                
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                      
                    ),
                   
                    onChanged: (value){
                      email=value;
                      
                    },
                    validator: (value){
                
                      if(value!.isEmpty)
                      return "Required";
                      if(!value.endsWith("@gmail.com"))
                      {
                        return "not a vaild email";
                
                      }
                      
                
                      return null;
                
                
                    },
                  
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Icon(
                          Icons.lock,
                        ),
                      ),
                     
                  ),
                    obscureText: true,
                    onChanged: (value){
                      password=value;
                    },
                
                    validator: (value){
                      if(value!.isEmpty)
                      return "Required";
                
                      else
                      return null;
                    },
                    
                  ),
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: (){
                
                      }, child:Text("Forgot password?"),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.red[300])
                      ), ),
                    ],
                  ),
                
                
                  ElevatedButton(onPressed: () async{
                
                    if(_formKey.currentState!.validate()==true)
                    {
                       dynamic check =await AuthService().signInWithEmailAndPassword(this.email,this.password);
                
                  if(check==true) 
                  {
                
                    Navigator.of(context).pop();
                     Navigator.push(context, MaterialPageRoute(builder:(context){
                      return HomePage();
                    }));
                
                  }
                   
               else{
                
                    setState(() {
                          errstring='Password is not matched';
                       });
                
                 }
                
                
                    }
                
                  
                    
                
              },
                   child:Text("Login"),
                
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
                  ),
                   
                   ),
                
                   
                
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Not have an account ?"),
                       TextButton(
                         child: Text("Register"),
                         onPressed: (){
                           
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return RegisterScreen();
                
                           }));
                         },
                       ),
                     ],
                   )
                
                
                
                ],
             ),
             ),
           ),
         ],
       ),
     ), 
    );
  }
}