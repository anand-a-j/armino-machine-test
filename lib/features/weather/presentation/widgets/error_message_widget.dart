import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/core/constants/colors.dart';
import 'package:simple_weather_app/features/weather/presentation/bloc/weather/weather_bloc.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;
  const ErrorMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Error!",
              style: TextStyle(
                  fontSize: 42, fontWeight: FontWeight.bold, color: secondaryColor),
            ),
            const SizedBox(height: 15),
            Text(
              message,
              style: const TextStyle(fontSize: 18, color: kWhite),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                context.read<WeatherBloc>().add(
                    const GetCurrentWeatherEvent());
              }, 
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(secondaryColor)
              ),
              child: const Text("Retry"),
              )
          ],
        ),
      ),
    );
  }
}
