import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_WeatherCubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => MaterialApp(
          theme: ThemeData(
              primarySwatch: getThemeColor(
            BlocProvider.of<GetWeatherCubit>(context)
                .weathermodel
                ?.weatherconditon,
          )),
          home: const HomeView(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.yellow;
  }
  switch (condition) {
    case 'Sunny':
    case 'clear':
      return Colors.amber; // Sunny/clear skies
    case 'partly cloudy':
      return Colors.lightBlue; // Partly cloudy weather
    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey; // Cloudy or overcast
    case 'mist':
    case 'fog':
      return Colors.grey; // Misty or foggy weather
    case 'patchy rain possible':
    case 'light drizzle':
    case 'light rain':
      return Colors.blue; // Light rain or drizzle
    case 'moderate rain':
    case 'heavy rain':
      return Colors.blue; // Moderate to heavy rain
    case 'thundery outbreaks possible':
    case 'rain with thunder':
      return Colors.deepPurple; // Thunderstorms
    case 'light snow':
    case 'snow':
      return Colors.cyan; // Snow or light snow
    case 'blizzard':
    case 'heavy snow':
      return Colors.indigo; // Blizzard or heavy snow
    case 'patchy sleet possible':
    case 'sleet':
      return Colors.blue; // Sleet
    case 'freezing drizzle':
    case 'freezing fog':
      return Colors.lightBlue;
    case 'ice pellets':
      return Colors.cyan;
    default:
      return Colors.blue; // Default for unknown weather
  }
}
