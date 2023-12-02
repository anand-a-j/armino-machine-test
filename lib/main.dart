import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/core/constants/colors.dart';
import 'package:simple_weather_app/dependency_injection.dart';
import 'package:simple_weather_app/features/weather/presentation/screens/weather/weather_screen.dart';
import 'features/weather/presentation/bloc/weather/weather_bloc.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => locator<WeatherBloc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Weather App',
         theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: primaryColor.withAlpha(40)
         ),
         home: const WeatherScreen(),
      ),
    );
  }
}
