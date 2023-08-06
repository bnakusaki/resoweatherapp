// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:resoweatherapp/features/daily_weather/presentation/ui/pages/overview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resoweatherapp/features/daily_weather/presentation/weather_page.dart';
// import 'features/daily_weather/presentation/weather_page.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('en')],
      locale: Locale('en'),
      // home: WeatherOverViewPage(),
      home: DummyWeatherScreen(),
    );
  }
}
