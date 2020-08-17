import 'package:flutter/material.dart';

class ActiveCasesWidget extends StatelessWidget {
  String activeCases;
  ActiveCasesWidget({@required this.activeCases});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: ListTile(
          leading: Icon(Icons.account_balance),
          title: Center(
              child: Text("Active Cases: "+activeCases,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),)),
        ));


  }
}
