import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/core/constants/colors.dart';
import 'package:simple_weather_app/features/weather/presentation/bloc/weather/weather_bloc.dart';
import 'package:simple_weather_app/features/weather/presentation/widgets/current_weather.dart';
import 'package:simple_weather_app/features/weather/presentation/widgets/error_message_widget.dart';
import 'package:simple_weather_app/features/weather/presentation/widgets/random_text.dart';
import 'package:simple_weather_app/features/weather/presentation/widgets/weekly_weather.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherBloc>().add(const GetCurrentWeatherEvent());
    });

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover)),
        child: Scaffold(
          
          body: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                );
              }

              if (state is WeatherSuccessState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      CurrentWeatherWidget(weather: state.result),
                      const WeeklyWeatherWidget(),
                      const RandomTextWidget()
                    ],
                  ),
                );
              }

              if (state is WeatherFailureState) {
                return ErrorMessageWidget(message: state.message);
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

