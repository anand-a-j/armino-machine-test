import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final double temp;
  final double feelLike;
  final int date;
  final int sunset;

  const WeatherEntity(
      {required this.cityName,
      required this.main,
      required this.description,
      required this.iconCode,
      required this.temp,
      required this.feelLike,
      required this.date,
      required this.sunset});

  @override
  List<Object?> get props => [
    cityName,
    main,
    description,
    iconCode,
    temp,
    feelLike,
    date,
    sunset
  ]; 
}
