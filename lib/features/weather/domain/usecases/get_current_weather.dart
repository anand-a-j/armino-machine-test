import 'package:dartz/dartz.dart';
import 'package:simple_weather_app/core/error/failure.dart';
import 'package:simple_weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:simple_weather_app/features/weather/domain/repository/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository);

  Future<Either<Failure, WeatherEntity>> execute() {
    return weatherRepository.getCurrentWeatherByLocation();
  }
}
