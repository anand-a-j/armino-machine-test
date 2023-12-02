import 'dart:convert';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:simple_weather_app/core/constants/urls.dart';
import 'package:simple_weather_app/core/error/exeption.dart';
import 'package:simple_weather_app/features/weather/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeatherByLocation();
  Future<WeatherModel> getCurrentWeather(double lat, double long);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeatherByLocation() async {
    try {
      double latitude = 0.0;
      double longitide = 0.0;

      try {
        await Geolocator.checkPermission();
        await Geolocator.requestPermission();
      } catch (e) {
        throw LocationExeption();
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitide = position.longitude;

      return await getCurrentWeather(latitude, longitide);

    } catch (e) {
      return throw const SocketException('');
    }
  }

  @override
  Future<WeatherModel> getCurrentWeather(double lat, double long) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByLatLong(lat, long)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerExeption();
    }
  }
}
