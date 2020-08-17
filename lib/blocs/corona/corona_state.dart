part of 'corona_bloc.dart';

abstract class CoronaState extends Equatable {
  const CoronaState();
}

class CoronaInitialState extends CoronaState {
  @override
  List<Object> get props => [];
}

class KoronaBilgileriYukleniyorState extends CoronaState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class KoronaBilgileriYuklendiState extends CoronaState{
  final ResultClass corona;
  final MaxCorona maxCorona;
  KoronaBilgileriYuklendiState({@required this.corona,@required this.maxCorona});

  @override
  // TODO: implement props
  List<Object> get props => [corona];


}

class KoronaBilgileriHataState extends CoronaState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}


