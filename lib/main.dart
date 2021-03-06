import 'package:countries/models/LanguageSpokenListScreen.dart';
import 'package:countries/utils/Constant.dart';
import 'package:countries/views/CountryListScreen.dart';
import 'package:countries/views/HomeScreen.dart';
import 'package:countries/views/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      onGenerateRoute: (settings) {
        print(settings.name);
        switch(settings.name) {
          case Constant.splashScreenRoute:
            return _displayScreen(SplashScreen());
          case Constant.homeScreenRoute:
            return _displayScreen(HomeScreen());
          case Constant.countryListScreenRoute:
            return _displayScreen(CountryListScreen(countryDetailModelList: settings.arguments,));
          case Constant.languageSpokenListRoute:
            return _displayScreen(LanguageSpokenListScreen(countryDetailModel: settings.arguments,));
          default: return _displayScreen(Container());
        }
      },
    );
  }

  MaterialPageRoute _displayScreen(Widget widget) {
    return MaterialPageRoute(builder: (context) {
      return widget;
    });
  }
}
