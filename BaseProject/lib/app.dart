import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newproject/localization/localisation.dart';
import 'package:newproject/ui/views/detailpage.dart';

class App extends StatefulWidget {
  @override
  _ClaasAppState createState() => _ClaasAppState();
}

class _ClaasAppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Detailpage(),
      locale: Locale("en"),
      localizationsDelegates: [
        DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('de', 'DE'),
      ], // switch between en and ru to see effect
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocaleLanguage in supportedLocales) {
          if (supportedLocaleLanguage.languageCode == locale.languageCode &&
              supportedLocaleLanguage.countryCode == locale.countryCode) {
            return supportedLocaleLanguage;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
