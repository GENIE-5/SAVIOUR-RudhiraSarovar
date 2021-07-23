import 'package:flutter/material.dart';
import 'package:saviour_flutter_app/screens/databasemanagement.dart';

class DonorsList extends StatefulWidget {
  final pincode;
  const DonorsList({Key? key, required this.pincode}) : super(key: key);

  @override
  _DonorsListState createState() => _DonorsListState(pincode);
}

class _DonorsListState extends State<DonorsList> {
  final pincode;
  List donors = [];
  getDonors(pincode) async {
    donors = await RequestHandler().getDonorsDataFromPincode(pincode: pincode);
  }

  _DonorsListState(this.pincode);
  @override
  void initState() {
    super.initState();
    // RequestHandler()
    //     .getDonorsDataFromPincode(pincode: pincode)
    //     .then((value) => setState(() => donors.add(value)));
    getDonors(pincode);

    print(donors);
  }

  @override
  Widget build(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width;
    var heightSize = MediaQuery.of(context).size.height;
    return Container(
      //color: Colors.black,
      child: ListView.builder(
        itemCount: donors.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.red,
              size: widthSize * 0.17,
            ),
            title: Container(
              padding: EdgeInsets.only(
                  left: widthSize * 0.02, top: heightSize * 0.02),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        '${donors[index]}',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {},
                      //shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(40)),
                      child: Text('request'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
