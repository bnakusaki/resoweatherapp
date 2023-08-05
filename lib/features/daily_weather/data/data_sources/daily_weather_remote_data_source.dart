import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily_weather_model.dart';

abstract class DailyWeatherRemoteDataSource {
  // Call for data with  the endpoint:- [https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&daily=temperature_2m_max,temperature_2m_min,windspeed_10m_max&timezone=GMT]
  Future<DailyWeatherModel> getDailyWeather();
}
