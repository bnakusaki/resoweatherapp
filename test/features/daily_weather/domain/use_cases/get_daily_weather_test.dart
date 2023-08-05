import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily.dart';
import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily_units.dart';
import 'package:resoweatherapp/features/daily_weather/domain/entities/daily_weather.dart';
import 'package:resoweatherapp/features/daily_weather/domain/repositories/daily_weather_repository.dart';
import 'package:resoweatherapp/features/daily_weather/domain/use_cases/get_daily_weather.dart';

// !CHECKED

class MockDailyWeatherRepository extends Mock implements DailyWeatherRepository {}

void main() {
  late MockDailyWeatherRepository mockRepository;
  late DailyWeather dailyWeather;
  late DailyUnits units;
  late Daily daily;
  late GetDailyWeather useCase;

  setUp(() {
    mockRepository = MockDailyWeatherRepository();

    useCase = GetDailyWeather(mockRepository);
  });

  units = DailyUnits(
    time: 'time',
    temperature2mMax: 'temperature2mMax',
    temperature2mMin: 'temperature2mMin',
    windspeed10mMax: 'windspeed10mMax',
  );

  daily = Daily(
    time: ['time'],
    temperature2mMax: ['temperature2mMax'],
    temperature2mMin: ['temperature2mMin'],
    windspeed10mMax: ['windspeed10mMax'],
  );

  dailyWeather = DailyWeather(
    latitude: 1.0,
    longitude: 1.0,
    generationtimeMs: 1.0,
    utcOffsetSecond: 1,
    timezone: 'timezone',
    timeZoneAbbreviation: 'timeZoneAbbreviation',
    elevation: 1.0,
    dailyUnits: units,
    daily: daily,
  );

  test('Data fetched through weather repository', () async {
    when(() => mockRepository.getDailyWeather()).thenAnswer((_) async => Right(dailyWeather));

    final result = await useCase();

    expect(result, Right(dailyWeather));

    verify(() => mockRepository.getDailyWeather()).called(1);
  });
}
