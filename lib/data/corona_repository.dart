
import 'package:corona_api_bloc_pattern/data/corona_api_client.dart';
import 'package:corona_api_bloc_pattern/models/corona.dart';
import 'package:corona_api_bloc_pattern/models/max_corona.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

class CoronaRepository{
  CoronaApiClient coronaApiClient=locator<CoronaApiClient>();
  Future<ResultClass> getCorona(String country) async{
    Corona corona=await getAllCorona();
    for(int i=0;i<corona.result.length;i++){
      if(corona.result[i]['country'].toLowerCase()==country.toLowerCase()){
        ResultClass resultClass=ResultClass.fromJson(corona.result[i]);
        return resultClass;
      }


    }
    return null;
  }
  Future<Corona> getAllCorona()async{
    Corona corona=await coronaApiClient.getCoronaCasesAll();
    return corona;
  }
  Future<MaxCorona> getMaxCorona() async{
    Corona corona=await getAllCorona();
    String maxTotalCasesCountry;
    String maxTotalCasesCount="0";
    String maxNewCasesCountry;
    String maxNewCasesCount="0";
    String maxTotalDeathsCountry;
    String maxTotalDeathsCount="0";
    String maxNewDeathsCountry;
    String maxNewDeathsCount="0";
    String maxTotalRecoveredCountry;
    String maxTotalRecoveredCount="0";
    String maxActiveCasesCountry;
    String maxActiveCasesCount="0";
    for(int i=0;i<corona.result.length;i++){
      if(i==0){
        ResultClass resultClass=ResultClass.fromJson(corona.result[i]);
        maxTotalCasesCountry=resultClass.country;
        maxTotalCasesCount=resultClass.totalCases.replaceAll(",", "");
        maxTotalCasesCount=maxTotalCasesCount.replaceAll("+", "");
        maxNewCasesCountry=resultClass.country;
        maxNewCasesCount=resultClass.newCases.replaceAll(",", "");
        maxNewCasesCount=maxNewCasesCount.replaceAll("+", "");
        maxTotalDeathsCountry=resultClass.country;
        maxTotalDeathsCount=resultClass.totalDeaths.replaceAll(",", "");
        maxTotalDeathsCount=maxTotalDeathsCount.replaceAll("+", "");
        maxNewDeathsCountry=resultClass.country;
        maxNewDeathsCount=resultClass.newDeaths.replaceAll(",", "");
        maxNewDeathsCount=maxNewDeathsCount.replaceAll("+", "");
        maxTotalRecoveredCountry=resultClass.country;
        maxTotalRecoveredCount=resultClass.totalRecovered.replaceAll(",", "");
        maxTotalRecoveredCount=maxTotalRecoveredCount.replaceAll("+", "");
        maxActiveCasesCountry=resultClass.country;
        maxActiveCasesCount=resultClass.activeCases.replaceAll(",", "");
        maxActiveCasesCount=maxActiveCasesCount.replaceAll("+", "");
      }
      else{
        ResultClass resultClass=ResultClass.fromJson(corona.result[i]);
        resultClass.totalCases=resultClass.totalCases.replaceAll(",", "");
        resultClass.totalCases=resultClass.totalCases.replaceAll("+", "");
        if(resultClass.totalCases!=null&&resultClass.totalCases!=""&&resultClass.totalCases!="N/A"){
          int totalCases=int.parse(resultClass.totalCases);
          int totalCasesMax=int.parse(maxTotalCasesCount);
          if(totalCases>totalCasesMax){
            maxTotalCasesCountry=resultClass.country;
            maxTotalCasesCount=resultClass.totalCases;
          }
        }
        resultClass.newCases=resultClass.newCases.replaceAll(",", "");
        resultClass.newCases=resultClass.newCases.replaceAll("+", "");
        if(resultClass.newCases!=null&&resultClass.newCases!=""&&resultClass.newCases!="N/A"){
          if(int.parse(resultClass.newCases)>int.parse(maxNewCasesCount)){
            maxNewCasesCountry=resultClass.country;
            maxNewCasesCount=resultClass.newCases;
          }
        }
        resultClass.totalDeaths=resultClass.totalDeaths.replaceAll(",", "");
        resultClass.totalDeaths=resultClass.totalDeaths.replaceAll("+", "");
        if(resultClass.totalDeaths!=null&&resultClass.totalDeaths!=""&&resultClass.totalDeaths!="N/A"){
          if(int.parse(resultClass.totalDeaths)>int.parse(maxTotalDeathsCount)){
            maxTotalDeathsCountry=resultClass.country;
            maxTotalDeathsCount=resultClass.totalDeaths;
          }
        }
        resultClass.newDeaths=resultClass.newDeaths.replaceAll(",", "");
        resultClass.newDeaths=resultClass.newDeaths.replaceAll("+", "");
        if(resultClass.newDeaths!=null && resultClass.newDeaths!=""&& resultClass.newDeaths!="N/A"){
          if(int.parse(resultClass.newDeaths)>int.parse(maxNewCasesCount)){
            maxNewDeathsCountry=resultClass.country;
            maxNewDeathsCount=resultClass.newDeaths;
          }
        }
        resultClass.totalRecovered=resultClass.totalRecovered.replaceAll(",", "");
        resultClass.totalRecovered=resultClass.totalRecovered.replaceAll("+", "");
        if(resultClass.totalRecovered!=null&&resultClass.totalRecovered!=""&&resultClass.totalRecovered!="N/A"){
          if(int.parse(resultClass.totalRecovered)>int.parse(maxTotalRecoveredCount)){
            maxTotalRecoveredCountry=resultClass.country;
            maxTotalRecoveredCount=resultClass.totalRecovered;
          }
        }
        resultClass.activeCases=resultClass.activeCases.replaceAll(",", "");
        resultClass.activeCases=resultClass.activeCases.replaceAll("+", "");
        if(resultClass.activeCases!=null &&resultClass.activeCases!=""&&resultClass.activeCases!="N/A"){
          if(int.parse(resultClass.activeCases)>int.parse(maxActiveCasesCount)){
            maxActiveCasesCountry=resultClass.country;
            maxActiveCasesCount=resultClass.activeCases;
          }
        }


      }
    }
    return MaxCorona(maxTotalCasesCountry,
        maxTotalCasesCount,
        maxNewCasesCountry,
        maxNewCasesCount,
        maxTotalDeathsCountry,
        maxTotalDeathsCount,
        maxNewDeathsCountry,
        maxNewDeathsCount,
        maxTotalRecoveredCountry,
        maxTotalRecoveredCount,
        maxActiveCasesCountry,
        maxActiveCasesCount);
  }
}