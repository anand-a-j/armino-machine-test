import 'package:flutter/material.dart';
import 'package:simple_weather_app/core/constants/colors.dart';
import 'package:simple_weather_app/core/constants/urls.dart';
import 'package:simple_weather_app/core/utils/formats.dart';
import 'package:simple_weather_app/features/weather/domain/entities/weather_entity.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherEntity weather;
  const CurrentWeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.035),
      width: 500,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Today",
                style: TextStyle(fontSize: 24, color: secondaryColor),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.expand_more,
                color: secondaryColor,
              ),
            ],
          ),
          SizedBox(height: height * 0.010),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 120,
                width: 120,
                fit: BoxFit.contain,
                image: NetworkImage(
                  Urls.weatherIcon(weather.iconCode),
                ),
                errorBuilder: (context, _, trace) {
                  return const Icon(
                    Icons.cloud,
                    size: 90,
                    color: secondaryColor,
                  );
                },
              ),
              SizedBox(height: height * 0.020),
              Text(
                "${convertToCelcius(weather.temp)}°",
                style: const TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.w600,
                    color: secondaryColor),
              )
            ],
          ),
          SizedBox(height: height * 0.020),
          Text(
            weather.main,
            style: const TextStyle(fontSize: 24 , color: secondaryColor),
          ),
          SizedBox(height: height * 0.020),
          Text(
            weather.cityName,
            style: const TextStyle(fontSize: 18, color: secondaryColor),
          ),
          SizedBox(height: height * 0.020),
          Text(
            convertToDate(weather.date),
            style: const TextStyle(fontSize: 18, color: secondaryColor),
          ),
          SizedBox(height: height * 0.020),
          Text(
            "Feels like ${convertToCelcius(weather.feelLike)} | Sunset ${convertToTime(weather.sunset)}",
            style: const TextStyle(fontSize: 18, color: secondaryColor),
          ),
        ],
      ),
    );
  }
}
