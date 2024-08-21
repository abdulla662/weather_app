import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_WeatherCubit/get_weather_states.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/views/search_view.dart';

class GetWeatherCubit extends Cubit<weatherstate> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModels? weathermodel;
  getweather({required String CityName}) async {
    try {
      weathermodel =
          await weather_services(Dio()).getcurrentweather(cityname: CityName);
      emit(Weatherloadedstate());
    } catch (e) {
      emit(Weatherfalilurestate());
    }
  }
}
