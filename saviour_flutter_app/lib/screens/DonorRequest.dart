import 'package:flutter/material.dart';

class DonorRequestScreen extends StatefulWidget {
  const DonorRequestScreen({Key? key}) : super(key: key);

  @override
  _DonorRequestScreenState createState() => _DonorRequestScreenState();
}

class _DonorRequestScreenState extends State<DonorRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Request List"),
      ),
    );
  }
}
