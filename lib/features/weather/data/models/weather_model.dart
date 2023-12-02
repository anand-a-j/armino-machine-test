import 'package:simple_weather_app/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {

  const WeatherModel(
      {required String cityName,
      required String main,
      required String description,
      required String iconCode,
      required double temp,
      required double feelLike,
      required int date,
      required int sunset})
      : super(
            cityName: cityName,
            main: main,
            description: description,
            iconCode: iconCode,
            temp: temp,
            feelLike: feelLike,
            date: date,
            sunset: sunset);

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      cityName: json['name'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
      temp: json['main']['temp'],
      feelLike: json['main']['feels_like'],
      date: json['dt'],
      sunset: json['sys']['sunset']);

  Map<String, dynamic> toJson() => {
        'weather': [
          {'main': main, 'description': description, 'icon': iconCode}
        ],
        'main': {
          'temp': temp,
          'feels_like': feelLike,
        },
        'name': cityName,
        'dt': date,
        'sys': {'sunset': sunset}
      };

  WeatherEntity toEntity() => WeatherEntity(
      cityName: cityName,
      main: main,
      description: description,
      iconCode: iconCode,
      temp: temp,
      feelLike: feelLike,
      date: date,
      sunset: sunset);
}
