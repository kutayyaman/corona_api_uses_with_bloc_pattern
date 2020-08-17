import 'package:corona_api_bloc_pattern/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/corona/corona_bloc.dart';
import 'widget/corona_app.dart';

void main() {
  setupLocator();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Corona States App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CoronaBloc>(
          create: (context) => CoronaBloc(), child: CoronaApp()),
    );
  }
}
