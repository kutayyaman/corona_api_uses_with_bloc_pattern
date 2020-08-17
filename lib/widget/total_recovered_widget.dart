import 'package:flutter/material.dart';

class TotalRecoveredWidget extends StatelessWidget {
  String totalRecovered;
  TotalRecoveredWidget({@required this.totalRecovered});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: ListTile(
          leading: Icon(Icons.account_balance),
          title: Center(
              child: Text("Total Recovered: "+totalRecovered,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),)),
        ));


  }
}
