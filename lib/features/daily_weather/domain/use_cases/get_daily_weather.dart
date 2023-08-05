import 'package:dartz/dartz.dart';
import 'package:resoweatherapp/core/error/failures.dart';
import 'package:resoweatherapp/features/daily_weather/domain/entities/daily_weather.dart';
import 'package:resoweatherapp/features/daily_weather/domain/repositories/daily_weather_repository.dart';

class GetDailyWeather {
  final DailyWeatherRepository repository;

  GetDailyWeather(this.repository);

  Future<Either<Failure, DailyWeather>> call() async {
    return await repository.getDailyWeather();
  }
}
