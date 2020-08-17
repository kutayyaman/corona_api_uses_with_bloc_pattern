import 'package:flutter/material.dart';

class TotalDeathsWidget extends StatelessWidget {
  String totalDeaths;
  TotalDeathsWidget({@required this.totalDeaths});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: ListTile(
          leading: Icon(Icons.account_balance),
          title: Center(
              child: Text("Total Deaths: "+totalDeaths,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),)),
        ));


  }
}
