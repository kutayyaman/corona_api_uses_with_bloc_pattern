import 'package:flutter/material.dart';

class NewDeathsWidget extends StatelessWidget {
  String newDeaths;
  NewDeathsWidget({@required this.newDeaths});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: ListTile(
          leading: Icon(Icons.account_balance),
          title: Center(
              child: Text("New Deaths: "+newDeaths,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),)),
        ));


  }
}
