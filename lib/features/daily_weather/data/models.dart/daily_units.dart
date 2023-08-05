import 'package:equatable/equatable.dart';

// !CHECKED

class DailyUnits extends Equatable {
  String time;
  String temperature2mMax;
  String temperature2mMin;
  String windspeed10mMax;

  DailyUnits({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.windspeed10mMax,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json['time'] ?? '',
      temperature2mMax: json['temperature_2m_max'] ?? '',
      temperature2mMin: json['temperature_2mM_mn'] ?? '',
      windspeed10mMax: json['windspeed_10m_max'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        time,
        temperature2mMax,
        temperature2mMin,
        windspeed10mMax,
      ];
}
