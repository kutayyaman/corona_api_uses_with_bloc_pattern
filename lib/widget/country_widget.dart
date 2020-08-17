import 'package:flutter/material.dart';

class CountryWidget extends StatelessWidget {
  String enteredCountry="";
  CountryWidget({@required this.enteredCountry});
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blueGrey,child: ListTile(leading: Icon(Icons.account_balance),title: Center(child: Text(enteredCountry,style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),)),));
  }
}
