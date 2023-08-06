import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:resoweatherapp/core/platform/network/network_info.dart';
import 'package:resoweatherapp/features/daily_weather/data/data_sources/daily_weather_remote_data_source.dart';
import 'package:resoweatherapp/features/daily_weather/data/data_sources/daily_weather_remote_data_source_implementation.dart';
import 'package:resoweatherapp/features/daily_weather/data/repositories/daily_weather_repository_impl.dart';
import 'package:resoweatherapp/features/daily_weather/domain/repositories/daily_weather_repository.dart';
import 'package:resoweatherapp/features/daily_weather/domain/use_cases/get_daily_weather.dart';
import 'package:resoweatherapp/features/daily_weather/presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;

void init() {
  // ! Features - Daily Weather
  sl.registerFactory(() => GetDailyWeather(sl()));
  sl.registerFactory(() => WeatherBLoc(dailyWeather: sl()));

  // ! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // ! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());

  // ! Repositories
  sl.registerLazySingleton<DailyWeatherRepository>(
    () => DailyWeatherRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // ! Data Source
  sl.registerLazySingleton<DailyWeatherRemoteDataSource>(
    () => DailyWeatherRemoteDataSourceImpl(
      client: sl(),
    ),
  );
}
