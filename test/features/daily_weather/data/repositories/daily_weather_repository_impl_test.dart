import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resoweatherapp/core/error/failures.dart';
import 'package:resoweatherapp/core/platform/network/network_info.dart';
import 'package:resoweatherapp/features/daily_weather/data/data_sources/daily_weather_remote_data_source.dart';
import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily.dart';
import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily_units.dart';
import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily_weather_model.dart';
import 'package:resoweatherapp/features/daily_weather/data/repositories/daily_weather_repository_impl.dart';
import 'package:resoweatherapp/features/daily_weather/domain/entities/daily_weather.dart';

class MockDailyWeatherRemoteDataSource extends Mock implements DailyWeatherRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late DailyWeatherRepositoryImpl repositoryImpl;
  late MockDailyWeatherRemoteDataSource mockRemoteSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteSource = MockDailyWeatherRemoteDataSource();
    repositoryImpl = DailyWeatherRepositoryImpl(
      remoteDataSource: mockRemoteSource,
      networkInfo: mockNetworkInfo,
    );
  });
  final tDailyWeatherModel = DailyWeatherModel(
      latitude: 52.52,
      longitude: 13.419998,
      generationtimeMs: 0.6279945373535156,
      utcOffsetSecond: 0,
      timezone: 'GMT',
      timeZoneAbbreviation: 'GMT',
      elevation: 38.0,
      dailyUnits: DailyUnits.fromJson(
        const {
          "time": "iso8601",
          "temperature_2m_max": "°C",
          "temperature_2m_min": "°C",
          "windspeed_10m_max": "km/h",
        },
      ),
      daily: Daily.fromJson(const {
        "time": ["2023-08-04", "2023-08-05", "2023-08-06", "2023-08-07", "2023-08-08", "2023-08-09", "2023-08-10"],
        "temperature_2m_max": [22.3, 20.5, 18.0, 17.3, 20.1, 21.6, 23.5],
        "temperature_2m_min": [15.8, 13.8, 15.1, 14.9, 13.6, 14.5, 17.6],
        "windspeed_10m_max": [15.2, 9.1, 8.3, 20.7, 22.3, 12.4, 9.7]
      }));

  group('device is online', () {
    test('network is connected', () {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteSource.getDailyWeather()).thenAnswer((_) async => tDailyWeatherModel);
      // act
      repositoryImpl.getDailyWeather();
      // assert
      verify(() => mockNetworkInfo.isConnected);
    });

    setUp(() {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test('return remote data when call to remote data source is sucessfull', () async {
      // arrange
      when(() => mockRemoteSource.getDailyWeather()).thenAnswer((_) async => tDailyWeatherModel);
      // act
      final result = await repositoryImpl.getDailyWeather();
      //assert
      verify(mockRemoteSource.getDailyWeather);

      expect(result, equals(Right(tDailyWeatherModel)));
    });
  });

  group('device is offline', () {
    test('device is offline', () async {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((invocation) async => false);
      // when(() => mockRemoteSource.getDailyWeather()).thenAnswer((invocation) async => ServerFailure());
      // act
      repositoryImpl.getDailyWeather();

      final result = await repositoryImpl.getDailyWeather();
      //assert
      verify(() => mockNetworkInfo.isConnected);
      // verify(() => mockRemoteSource.getDailyWeather());
      expect(result, Left(ServerFailure()));
    });
  });
}
