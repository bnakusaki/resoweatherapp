import 'dart:convert';

import 'package:resoweatherapp/core/error/exceptions.dart';
import 'package:resoweatherapp/features/daily_weather/data/data_sources/daily_weather_remote_data_source.dart';
import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily_weather_model.dart';
import 'package:http/http.dart' as http;

class DailyWeatherRemoteDataSourceImpl implements DailyWeatherRemoteDataSource {
  final http.Client client;

  DailyWeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<DailyWeatherModel> getDailyWeather() async {
    final response = await client.get(Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&daily=temperature_2m_max,temperature_2m_min,windspeed_10m_max&timezone=GMT'));

    if (response.statusCode == 200) {
      return DailyWeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
