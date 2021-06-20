import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:saviour_flutter_app/screens/authenticate.dart';
import 'package:saviour_flutter_app/screens/signinscreen.dart';
//import 'package:provider/provider.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
  
        
        return
         MaterialApp(
            home: SignInPage(),
        
        );
      
  }
}
