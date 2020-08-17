import 'package:corona_api_bloc_pattern/blocs/corona/corona_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'active_cases_widget.dart';
import 'country_widget.dart';
import 'max_corona_widget.dart';
import 'new_cases_widget.dart';
import 'new_deaths_widget.dart';
import 'total_cases_widget.dart';
import 'total_deaths_widget.dart';
import 'total_recovered_widget.dart';

class CoronaApp extends StatelessWidget {
  final _textController = TextEditingController();
  String enteredCountryName;
  @override
  Widget build(BuildContext context) {
    final _coronaBloc = BlocProvider.of<CoronaBloc>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("Corona Cases"),
      ),
      body: BlocBuilder(
        cubit: _coronaBloc,
        builder: (context, CoronaState state) {
          if (state is CoronaInitialState) {
            return Column(
              children: [
                searchBar(_coronaBloc),
                Center(
                  child: Text(
                    "Write a country like USA,Turkey,UK.",
                    style: TextStyle(fontSize: 24,color: Colors.white),
                  ),
                ),
              ],
            );
          } else if (state is KoronaBilgileriYukleniyorState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is KoronaBilgileriYuklendiState) {
            final getirilenCoronaBilgileri = state.corona;
            final getirilenMaxCoronaBilgileri = state.maxCorona;

            return ListView(
              children: [
                Card(
                  color: Colors.white,
                  elevation: 12,
                  shadowColor: Colors.white,
                  child: Column(
                    children: [
                      searchBar(_coronaBloc),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: CountryWidget(
                              enteredCountry: getirilenCoronaBilgileri.country,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: TotalCasesWidget(
                              totalCases: getirilenCoronaBilgileri.totalCases,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: NewCasesWidget(
                              newCases: getirilenCoronaBilgileri.newCases,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: TotalDeathsWidget(
                              totalDeaths: getirilenCoronaBilgileri.totalDeaths,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: NewDeathsWidget(
                              newDeaths: getirilenCoronaBilgileri.newDeaths,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: TotalRecoveredWidget(
                              totalRecovered:
                              getirilenCoronaBilgileri.totalRecovered,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: ActiveCasesWidget(
                              activeCases: getirilenCoronaBilgileri.activeCases,
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Container(
                          color: Colors.white,
                          child: ListTile(
                            title: Center(
                                child: Text("Maximum Cases",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),)),
                          ))),
                ),
                Card(
                    color: Colors.white,
                    elevation: 12,
                    shadowColor: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: MaxCoronaWidget(
                                countryBilgisi: getirilenMaxCoronaBilgileri.maxTotalCasesCountry,
                                degeri: getirilenMaxCoronaBilgileri.maxTotalCasesCount,
                                neyinMaxi: "Where is the most total cases: ",
                              )),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: MaxCoronaWidget(
                                countryBilgisi: getirilenMaxCoronaBilgileri.maxNewCasesCountry,
                                degeri: getirilenMaxCoronaBilgileri.maxNewCasesCount,
                                neyinMaxi: "Where is the most new cases: ",
                              )),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: MaxCoronaWidget(
                                countryBilgisi: getirilenMaxCoronaBilgileri.maxTotalDeathsCountry,
                                degeri: getirilenMaxCoronaBilgileri.maxTotalDeathsCount,
                                neyinMaxi: "Where is the most deaths: ",
                              )),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: MaxCoronaWidget(
                                countryBilgisi: getirilenMaxCoronaBilgileri.maxNewDeathsCountry,
                                degeri: getirilenMaxCoronaBilgileri.maxNewDeathsCount,
                                neyinMaxi: "Where is the most new deaths: ",
                              )),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: MaxCoronaWidget(
                                countryBilgisi: getirilenMaxCoronaBilgileri.maxTotalRecoveredCountry,
                                degeri: getirilenMaxCoronaBilgileri.maxTotalRecoveredCount,
                                neyinMaxi: "Where is the most total recovered: ",
                              )),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: MaxCoronaWidget(
                                countryBilgisi: getirilenMaxCoronaBilgileri.maxActiveCasesCountry,
                                degeri: getirilenMaxCoronaBilgileri.maxActiveCasesCount,
                                neyinMaxi: "Where is the most active cases: ",
                              )),
                        ),
                      ],
                    )),
              ],
            );
          } else if (state is KoronaBilgileriHataState) {
            return Center(
              child: Column(
                children: [
                  searchBar(_coronaBloc),
                  Text("Check your internet connection or write correctly.",style: TextStyle(color: Colors.white),),
                ],
              ),
            );
          } else
            return Center(
              child: searchBar(_coronaBloc),
            );
        },
      ),
    );
  }

  Padding searchBar(CoronaBloc coronaBloc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Container(
        child: Form(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    controller: _textController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      focusColor: Colors.black,
                      labelText: "Enter country name",
                      hintText: "Enter country name",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  enteredCountryName = _textController.text;
                  if (enteredCountryName != null) {
                    coronaBloc.add(
                        CoronaBilgiGetirEvent(countryName: enteredCountryName));
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
