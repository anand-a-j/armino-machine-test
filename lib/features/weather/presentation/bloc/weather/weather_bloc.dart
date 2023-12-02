import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:simple_weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:simple_weather_app/features/weather/domain/usecases/get_current_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  WeatherBloc(this._getCurrentWeatherUseCase) : super(WeatherInitial()) {
    on<GetCurrentWeatherEvent>(getCurrentWeather);
  }

  FutureOr<void> getCurrentWeather(event, emit) async {
    emit(WeatherLoadingState());
    final result =
        await _getCurrentWeatherUseCase.execute();

    result.fold(
      (failure) => emit(WeatherFailureState(failure.message)),
      (success) => emit(WeatherSuccessState(success)),
    );
  }
}
