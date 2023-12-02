import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:simple_weather_app/core/error/exeption.dart';
import 'package:simple_weather_app/core/error/failure.dart';
import 'package:simple_weather_app/features/weather/data/data_source/remote_data_source.dart';
import 'package:simple_weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:simple_weather_app/features/weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByLocation() async {
    try {
      final result =
          await weatherRemoteDataSource.getCurrentWeatherByLocation();
      return Right(result.toEntity());
    } on SocketException {
      return const Left(ConnectionFailure("Failed to connect to the network"));
    } on LocationExeption {
      return const Left(LocationFailure("Location Permission Denied"));
    } on ServerExeption {
      return const Left(ServerFailure("An error has occurred"));
    } 
  }
}
