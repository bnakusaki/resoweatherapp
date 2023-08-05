import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:resoweatherapp/core/error/exceptions.dart';
import 'package:resoweatherapp/core/error/failures.dart';
import 'package:resoweatherapp/features/daily_weather/data/data_sources/daily_weather_remote_data_source_implementation.dart';
import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily.dart';
import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily_units.dart';
import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily_weather_model.dart';

import '../../../../fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late DailyWeatherRemoteDataSourceImpl dataSource;
  late MockHttpClient httpClient;

  setUp(() {
    httpClient = MockHttpClient();
    dataSource = DailyWeatherRemoteDataSourceImpl(client: httpClient);
  });
  setUpAll(() {
    registerFallbackValue(Uri());
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

  group('Http request going through', () {
    test('Should get the weather with the URL', () {
      // arrange
      when(() => httpClient.get(any())).thenAnswer((_) async => http.Response(fixture('response.json'), 200));
      // act
      dataSource.getDailyWeather();
      // assert
      verify(() => httpClient.get(any()));
    });

    test('returns a DailyWeather when response code is 200', () async {
      // arrange
      when(() => httpClient.get(any())).thenAnswer((_) async => http.Response(fixture('response.json'), 200));
      // act
      final result = await dataSource.getDailyWeather();
      // assert
      expect(result, equals(tDailyWeatherModel));
    });

    test('returns a DailyWeather when response code is 404 or other', () async {
      // arrange
      when(() => httpClient.get(any())).thenAnswer((_) async => http.Response('Something went wrong', 404));
      // act
      final result = dataSource.getDailyWeather;
      // assert
      expect(() => result(), throwsA(const TypeMatcher<ServerFailure>()));
    });
  });
}
