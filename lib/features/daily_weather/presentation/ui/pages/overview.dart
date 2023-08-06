import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resoweatherapp/features/daily_weather/presentation/ui/widgets/glassmorph.dart';

class WeatherOverViewPage extends StatefulWidget {
  const WeatherOverViewPage({super.key});

  @override
  State<WeatherOverViewPage> createState() => _WeatherOverViewPageState();
}

class _WeatherOverViewPageState extends State<WeatherOverViewPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Glassmorph(
            height: 100,
            width: 100,
            child: Text(
              'Glassmorph',
              style: style(),
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle style() {
  return TextStyle(color: Colors.white.withOpacity(0.5));
}
