// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentWeatherEvent extends WeatherEvent {

  const GetCurrentWeatherEvent();

  @override
  List<Object> get props => [];
}
