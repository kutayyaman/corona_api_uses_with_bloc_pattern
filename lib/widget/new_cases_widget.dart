import 'package:flutter/material.dart';
class NewCasesWidget extends StatelessWidget {
  String newCases;
  NewCasesWidget({@required this.newCases});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: ListTile(
          leading: Icon(Icons.account_balance),
          title: Center(
              child: Text("New Cases: "+newCases,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),)),
        ));


  }
}
