import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:corona_api_bloc_pattern/data/corona_repository.dart';
import 'package:corona_api_bloc_pattern/locator.dart';
import 'package:corona_api_bloc_pattern/models/corona.dart';
import 'package:corona_api_bloc_pattern/models/max_corona.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'corona_event.dart';
part 'corona_state.dart';

class CoronaBloc extends Bloc<CoronaEvent, CoronaState> {
  final CoronaRepository coronaRepository=locator<CoronaRepository>();
  CoronaBloc() : super(CoronaInitialState());

  @override
  Stream<CoronaState> mapEventToState(CoronaEvent event,) async* {
    if(event is CoronaBilgiGetirEvent){
      yield KoronaBilgileriYukleniyorState();
      try{
        final ResultClass getirilenCoronaVakaBilgileri=await coronaRepository.getCorona(event.countryName);
        if(getirilenCoronaVakaBilgileri.country==null)
          yield KoronaBilgileriHataState();
        else{
          final MaxCorona maxCorona=await coronaRepository.getMaxCorona();
          yield KoronaBilgileriYuklendiState(corona: getirilenCoronaVakaBilgileri,maxCorona: maxCorona);
        }

      }catch(e){

        yield KoronaBilgileriHataState();
      }
    }
  }
}
