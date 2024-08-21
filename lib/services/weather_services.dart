import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_models.dart';

class weather_services {
  final Dio dio;
  final String baseurl = 'https://api.weatherapi.com/v1';
  final String apikey = 'a24b1e1d96ca4444b89141425241508';
  weather_services(this.dio);
  Future<WeatherModels> getcurrentweather({required String cityname}) async {
    try {
      Response response = await dio.get(
          '$baseurl/forecast.json?key=a24b1e1d96ca4444b89141425241508&q=$cityname&days=1&aqi=no&alerts=no');
      WeatherModels weatherData = WeatherModels.fromjson(response.data);
      print(weatherData);
      return weatherData;
    } on DioException catch (e) {
      final String errormessage =
          e.response?.data['error']['message'] ?? 'opps there was an error ';

      throw Exception(errormessage);
    } catch (e) {
      throw Exception(e);
    }
  }
}
