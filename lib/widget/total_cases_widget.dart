import 'package:flutter/material.dart';

class TotalCasesWidget extends StatelessWidget {
  String totalCases = "";
  TotalCasesWidget({@required this.totalCases});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: ListTile(
          leading: Icon(Icons.account_balance),
          title: Center(
              child: Text(
                "Total Cases: " + totalCases,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              )),
        ));


  }
}
