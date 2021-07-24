import 'package:flutter/material.dart';
 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saviour_flutter_app/screens/navigationScreen.dart';
import 'package:saviour_flutter_app/screens/signinscreen.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<CardsScreen> {
  dynamic userData;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {}

  String? username() {
    if (FirebaseAuth.instance.currentUser == null) return "no display";
    return FirebaseAuth.instance.currentUser!.displayName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white, opacity: 3.0),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignInPage();
                }));
              },
              icon: Icon(Icons.person))
        ],
      ),
      drawer: Drawer(child: NavigationPage()),
      body: Homebody(),
    );
  }
}

class Homebody extends StatefulWidget {
  const Homebody({Key? key}) : super(key: key);

  @override
  _HomebodyState createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 1, children: [
      Cards(),
      Cards(),
      Cards(),
      Cards(),
      Cards(),
      Cards(),
      Cards(),
      Cards(),
    ]);
  }
}

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Card(
         margin: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 25.0),
        elevation: 10.0,
        color: Colors.red,
        child:  Image(
           // fit:BoxFit.fill,
            image: NetworkImage(
              "https://thumbs.dreamstime.com/b/giving-blood-saves-lifes-blood-donation-give-life-business-team-76653412.jpg"),
              ),
        
        );
  }
}
