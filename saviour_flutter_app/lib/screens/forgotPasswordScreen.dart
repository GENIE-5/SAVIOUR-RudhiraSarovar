import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Registered e-mail',
                        hintText: "xyz@gmail.com",
                        border: UnderlineInputBorder(),
                      ),
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter OTP',
                        hintText: '234566',
                        border: UnderlineInputBorder(),
                      ),
                      controller: emailController,
                    ),
                    SizedBox(
                      height:20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'New password',
                        hintText: "asdfrygd@@156t",
                        border: UnderlineInputBorder(),
                      ),
                      controller: emailController,
                    ),
          
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
