import 'package:flutter/material.dart';
import 'package:saviour_flutter_app/screens/mapscreen.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'package:saviour_flutter_app/screens/cards.dart';
import 'package:saviour_flutter_app/screens/DonorRequest.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> pages = [
    CardsScreen(),
    GoogleMapScreen(),
    DonorRequestScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    // return pages.elementAt(pageIndex);
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List iconItems = [Icons.person, Icons.map, Icons.menu];
    List textItems = ["Our Connection", "Map", "Request List"];
    List colorItems = [
      Colors.red,
      Colors.red,
      Colors.red,
    ];
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
              top:
                  BorderSide(width: 2, color: Colors.black.withOpacity(0.06)))),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(textItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  children: [
                    Icon(iconItems[index],
                        color: pageIndex == index
                            ? colorItems[index]
                            : Colors.white.withOpacity(0.5)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: pageIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5)),
                    )
                  ],
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
