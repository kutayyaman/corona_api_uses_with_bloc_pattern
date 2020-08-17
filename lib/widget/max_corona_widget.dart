import 'package:flutter/material.dart';
class MaxCoronaWidget extends StatelessWidget {
  String neyinMaxi;
  String countryBilgisi;
  String degeri;
  MaxCoronaWidget({@required this.countryBilgisi,@required this.degeri,@required this.neyinMaxi});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: ListTile(
          leading: Icon(Icons.account_balance),
          title: Center(
              child: Text(neyinMaxi+countryBilgisi+": "+degeri,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),)),
        ));
  }
}
