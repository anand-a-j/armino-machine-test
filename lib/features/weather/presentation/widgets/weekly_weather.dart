import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:simple_weather_app/core/constants/colors.dart';

class WeeklyWeatherWidget extends StatelessWidget {
  const WeeklyWeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 30,
                width: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${index + 1} AM",
                      style: const TextStyle(fontSize: 16, color: kWhite),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud,
                          color: kWhite,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "25°",
                          style: TextStyle(fontSize: 14, color: kWhite),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class GlassMorphism extends StatelessWidget {
  final Widget child;

  const GlassMorphism({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GlassmorphicContainer(
        width: 500,
        height: 200,
         borderRadius: 15,
        blur: 100,
        alignment: Alignment.bottomCenter,
        border: 0,
        linearGradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0x0fffffff),
              Color(0x0fffffff),
            ],
            stops: [
              0.3,
              1,
            ]),
        borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0x0fffffff).withAlpha(01),
              const Color(0x0fffffff).withAlpha(100),
              const Color(0x0fffffff).withAlpha(01),
            ],
            stops: const [
              0.2,
              0.9,
              1,
            ]),
        child: child);
  }
}
