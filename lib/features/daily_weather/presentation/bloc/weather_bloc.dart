import 'package:dartz/dartz.dart';
import 'package:resoweatherapp/features/daily_weather/domain/entities/daily_weather.dart';
import 'package:resoweatherapp/features/daily_weather/domain/use_cases/get_daily_weather.dart';

class WeatherBLoc {
  final GetDailyWeather dailyWeather;
  WeatherBLoc({required this.dailyWeather});

  // Get daily weather update
  Future<Either<String, DailyWeather>> getDailyWeather() async {
    final result = await dailyWeather();
    return result.fold((l) => Left(l.message!), (r) => Right(r));
  }
}
