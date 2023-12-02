part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherEntity result;
  const WeatherSuccessState(this.result);

  @override
  List<Object> get props => [result];
}

class WeatherFailureState extends WeatherState {
  final String message;
  const WeatherFailureState(this.message);

  @override
  List<Object> get props => [message];
}
