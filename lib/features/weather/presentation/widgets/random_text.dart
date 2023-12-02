import 'package:flutter/material.dart';
import 'package:simple_weather_app/core/constants/colors.dart';
import 'package:simple_weather_app/core/constants/string.dart';

class RandomTextWidget extends StatelessWidget {
  const RandomTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 30),
        const Text(
          "Random Text",
          style: TextStyle(
            fontSize: 20,
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          randomText,
          style: TextStyle(
            fontSize: 14,
            color: kWhite.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
