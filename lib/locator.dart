
import 'package:corona_api_bloc_pattern/data/corona_api_client.dart';
import 'package:corona_api_bloc_pattern/data/corona_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator=GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => CoronaRepository());
  locator.registerLazySingleton(() => CoronaApiClient());
}