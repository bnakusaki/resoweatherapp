import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily.dart';
import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily_units.dart';
import 'package:resoweatherapp/features/daily_weather/domain/entities/daily_weather.dart';

// !CHECKED

class DailyWeatherModel extends DailyWeather {
  DailyWeatherModel({
    required double latitude,
    required double longitude,
    required double generationtimeMs,
    required int utcOffsetSecond,
    required String timezone,
    required String timeZoneAbbreviation,
    required double elevation,
    required DailyUnits dailyUnits,
    required Daily daily,
  }) : super(
          latitude: latitude,
          longitude: longitude,
          generationtimeMs: generationtimeMs,
          utcOffsetSecond: utcOffsetSecond,
          timezone: timezone,
          timeZoneAbbreviation: timeZoneAbbreviation,
          elevation: elevation,
          dailyUnits: dailyUnits,
          daily: daily,
        );
  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
      generationtimeMs: json['generationtime_ms'],
      utcOffsetSecond: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timeZoneAbbreviation: json['timezone_abbreviation'],
      elevation: json['elevation'],
      dailyUnits: DailyUnits.fromJson(json['daily_units']),
      daily: Daily.fromJson(json['daily']),
    );
  }

  // @override
  // bool operator ==(Object other) => identical(this, other) || other is DailyWeatherModel && runtimeType == other.runtimeType && latitude == other.latitude;
//
  // @override
  // int get hashCode => latitude.hashCode;
}
