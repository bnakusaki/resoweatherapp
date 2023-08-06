import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resoweatherapp/features/daily_weather/presentation/bloc/weather_bloc.dart';
import 'package:resoweatherapp/injection_container.dart';

class DummyWeatherScreen extends StatefulWidget {
  const DummyWeatherScreen({super.key});

  @override
  State<DummyWeatherScreen> createState() => _DummyWeatherScreenState();
}

class _DummyWeatherScreenState extends State<DummyWeatherScreen> {
  // dynamic weather;

  // weatherFetch() async {
  // NetworkInfoImpl info = NetworkInfoImpl();
  // http.Client client = http.Client();
  // DailyWeatherRepositoryImpl repository = DailyWeatherRepositoryImpl(
  // remoteDataSource: DailyWeatherRemoteDataSourceImpl(client: client),
  // networkInfo: info,
  // );
  // final response = await GetDailyWeather(repository).call();
  // if (response is Right<Failure, DailyWeather>) {
  // setState(() {
  // weather = response;
  // });
  // }
  // }

  @override
  Widget build(BuildContext context) {
    final bloc = sl<WeatherBLoc>();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('${bloc.getDailyWeather()}'),
        ),
      ),
    );
  }
}
