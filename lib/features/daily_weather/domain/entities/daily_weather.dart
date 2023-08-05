import 'package:equatable/equatable.dart';
import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily.dart';
import 'package:resoweatherapp/features/daily_weather/data/models.dart/daily_units.dart';

// !CHECKED

class DailyWeather extends Equatable {
  double latitude;
  double longitude;
  double generationtimeMs;
  int utcOffsetSecond;
  String timezone;
  String timeZoneAbbreviation;
  double elevation;
  DailyUnits dailyUnits;
  Daily daily;

  DailyWeather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSecond,
    required this.timezone,
    required this.timeZoneAbbreviation,
    required this.elevation,
    required this.dailyUnits,
    required this.daily,
  });

  @override
  List<Object> get props => [
        latitude,
        longitude,
        generationtimeMs,
        utcOffsetSecond,
        timezone,
        timeZoneAbbreviation,
        elevation,
        dailyUnits,
        daily,
      ];

  // factory DailyWeather.fromJson(Map<String, dynamic> json) {
  // return DailyWeather(
  // latitude: json['latitude'],
  // longitude: json['longitude'],
  // generationtimeMs: json['generationtime_ms'],
  // utcOffsetSecond: json['utcOffset_second'],
  // timezone: json['timezone'],
  // timeZoneAbbreviation: json['time_zone_abbreviation'],
  // elevation: json['elevation'],
  // dailyUnits: json['daily_units'],
  // daily: json['daily'],
  // );
  // }
}
