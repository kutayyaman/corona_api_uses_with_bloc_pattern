part of 'corona_bloc.dart';

abstract class CoronaEvent extends Equatable {
  const CoronaEvent();
}

class CoronaBilgiGetirEvent extends CoronaEvent{
  final String countryName;
  CoronaBilgiGetirEvent({@required this.countryName});
  @override
  // TODO: implement props
  List<Object> get props => [countryName];



}
