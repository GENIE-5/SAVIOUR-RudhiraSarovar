import 'package:flutter/material.dart';
import 'package:saviour_flutter_app/screens/authenticate.dart';
import 'package:saviour_flutter_app/screens/register1.dart';
import 'package:saviour_flutter_app/screens/signinscreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _registrationKey=GlobalKey<FormState>();
  final service = GlobalObjectKey(AuthService());
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [

          
          AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),



          //SignUp Text
          Container(
            width: 512,
            margin: EdgeInsets.only(
                left: deviceWidth * 0.40,
                top: deviceHeight * 0.04,
                bottom: deviceHeight * 0.02),
            child: Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: deviceHeight * 0.03, fontWeight: FontWeight.bold),
            ),
          ),


          
          Form(
            autovalidateMode: AutovalidateMode.always,
            key:_registrationKey,
            child: Column(
              children: [
          
                //UserName
                Container(
                  width: deviceWidth * 0.8,
                  margin: EdgeInsets.only(bottom: deviceHeight * 0.03),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      accentColor: Colors.red,
                    ),
                    child: TextFormField(
                      
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Icon(
                              Icons.account_circle,
                            ),
                          ),
                          hintText: ("User Name"),
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      controller: userNameController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty)
                        return "Required";
                        else
                        return null;
                      },
                    
                    ),
                  ),
                ),
          
          
          
                //EmailField
                Container(
                  width: deviceWidth * 0.8,
                  margin: EdgeInsets.only(bottom: deviceHeight * 0.03),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      accentColor: Colors.red,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIconConstraints:
                              BoxConstraints(minWidth: 23, maxHeight: 20),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Icon(
                              Icons.email,
                            ),
                          ),
                          hintText: ("Email Address"),
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      validator:(value){
                        if(value!.isEmpty)
                        return "Required";
                        if(!value.endsWith("@gmail.com"))
                        return "Invalid email address";

                        return null;
                      }
                    ),
                  ),
                ),
          
          
                //Password
                Container(
                  width: deviceWidth * 0.8,
                  margin: EdgeInsets.only(
                      bottom: deviceHeight * 0.05, top: deviceHeight * 0.01),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      accentColor: Colors.red,
                    ),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIconConstraints:
                              BoxConstraints(minWidth: 23, maxHeight: 20),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Icon(
                              Icons.lock,
                            ),
                          ),
                          hintText: ("Password"),
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      controller: passwordController,
                      autofocus: true,
                      validator: (value){
                        if(value!.isEmpty)
                        return "Required";

                        if(value.length<8)
                        return "password should contain atleast 8 characters";

                        if(value.length>18)
                        return "password should not contain more than 18 characters";

                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Continue button
          Container(
              padding: EdgeInsets.only(top: 25),
              child: Container(
                width: deviceWidth * 0.4,
                child: ElevatedButton(
                  child: Text("Continue"),
                  onPressed: () {
                    if(_registrationKey.currentState!.validate())
                    {
                     
                      
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Register1Screen(
                            username: userNameController.text,
                            email: email.text,
                            password: passwordController.text,
                          )),
                    );

                    }


                  },
                ),
              )),

              //Already have an account text
          Container(
              padding: EdgeInsets.only(top: deviceHeight * 0.0002),
              child: Row(
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontSize: deviceWidth * 0.035, color: Colors.white),
                  ),

                  //signIn Text Button
                  TextButton(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: deviceWidth * 0.035,
                              color: Colors.lightBlueAccent),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                       return SignInPage();
                     }));
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
        ],
      )),
    );
  }
}
