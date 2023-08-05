import 'package:equatable/equatable.dart';

// !CHECKED

class Daily extends Equatable {
  List time, temperature2mMax, temperature2mMin, windspeed10mMax;

  Daily({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.windspeed10mMax,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: json['time'] ?? [],
      temperature2mMax: json['temperature_2m_max'] ?? [],
      temperature2mMin: json['temperature_2m_min'] ?? [],
      windspeed10mMax: json['windspeed_10m_max'] ?? [],
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
