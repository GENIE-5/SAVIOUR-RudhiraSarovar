import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("About"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
                "Saviour-( A Rudhira Sarovar ) is an app which lets you find a blood donor easily at any required time. This app is a connection between blood donor and blood receptor. The users required to register with the app using their mobile number or email. Whenever a person requires blood, he/she can login into the app to use and can find the blood donor at a nearby location. Then he/she can contact the blood donor for help using the registered mobile number.",
                style: TextStyle(fontSize: 20,height: 1.5),),
          ),
          Image(image:  
          NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH8r6XQDFiox6G_h_sLRf9_r1cxzagU-55iQ&usqp=CAU"
          )
          ),

        ],
      ),
    );
  }
}
