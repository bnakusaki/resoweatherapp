import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resoweatherapp/features/daily_weather/domain/entities/daily_weather.dart';
import 'package:resoweatherapp/features/daily_weather/presentation/bloc/weather_bloc.dart';
import 'package:resoweatherapp/injection_container.dart';

class DummyWeatherScreen extends StatefulWidget {
  const DummyWeatherScreen({super.key});

  @override
  State<DummyWeatherScreen> createState() => _DummyWeatherScreenState();
}

class _DummyWeatherScreenState extends State<DummyWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = sl<WeatherBLoc>();

    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: bloc.getDailyWeather(),
          builder: (context, snapshot) {
            return Center(
              child: snapshot.connectionState == ConnectionState.waiting
                  ? const CupertinoActivityIndicator()
                  : (snapshot.data is Right<String, DailyWeather>)
                      ? Text('${(snapshot.data as Right<String, DailyWeather>).value}')
                      : Text((snapshot.data as Left<String, DailyWeather>).value),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await bloc.dailyWeather();
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
