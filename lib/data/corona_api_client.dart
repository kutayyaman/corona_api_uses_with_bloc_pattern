import 'dart:convert';

import 'package:corona_api_bloc_pattern/models/corona.dart';
import 'package:http/http.dart' as http;
class CoronaApiClient{
  static const baseUrl="https://api.collectapi.com";
  final http.Client httpClient=http.Client();

  Future<Corona> getCoronaCasesAll() async{
    final coronaUrl=baseUrl+"/corona/countriesData";
    final gelenCevap=await httpClient.get(coronaUrl,headers: {
      'content-type': 'application/json',
      'authorization': 'apikey 6tNZefTGXgCSdx8mKAQg6b:3iYckadn6L66h5ohhYOqgm'
    });
    if(gelenCevap.statusCode !=200){
      throw Exception("Veri getirelemedi");
    }
    final gelenCevapJSON=jsonDecode(gelenCevap.body);
    return Corona.fromJson(gelenCevapJSON);
  }
}