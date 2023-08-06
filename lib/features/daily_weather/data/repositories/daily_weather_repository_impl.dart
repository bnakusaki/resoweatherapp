import 'package:dartz/dartz.dart';
import 'package:resoweatherapp/core/error/exceptions.dart';
import 'package:resoweatherapp/core/error/failures.dart';
import 'package:resoweatherapp/core/platform/network/network_info.dart';
import 'package:resoweatherapp/features/daily_weather/data/data_sources/daily_weather_remote_data_source.dart';
import 'package:resoweatherapp/features/daily_weather/domain/entities/daily_weather.dart';
import 'package:resoweatherapp/features/daily_weather/domain/repositories/daily_weather_repository.dart';

class DailyWeatherRepositoryImpl implements DailyWeatherRepository {
  final DailyWeatherRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DailyWeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DailyWeather>> getDailyWeather() async {
    if (await networkInfo.isConnected) {
      try {
        final weather = await remoteDataSource.getDailyWeather();
        return Right(weather);
      } on ServerException {
        return const Left(ServerFailure('Oops, something is wrong'));
      }
    } else {
      return const Left(ServerFailure('Oops, something is wrong'));
    }
  }
}
