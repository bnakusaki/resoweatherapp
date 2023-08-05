import 'package:dartz/dartz.dart';
import 'package:resoweatherapp/core/error/failures.dart';
import 'package:resoweatherapp/features/daily_weather/domain/entities/daily_weather.dart';

// !CHECKED

abstract class DailyWeatherRepository {
  Future<Either<Failure, DailyWeather>> getDailyWeather();
}
