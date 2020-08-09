import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:templateapp/screen/login.dart';
import 'package:templateapp/utils/classBuilder.dart';
import 'package:templateapp/utils/routes.dart';

void main() {
  ClassBuilder.registerClasses();
  var _defaultHome = LoginPage.id;

  runApp(MyApp(
    homeScreen: _defaultHome,
  ));
}

class MyApp extends StatelessWidget {
  final String homeScreen;
  const MyApp({@required this.homeScreen});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      initialRoute: homeScreen,
      debugShowCheckedModeBanner: false,
      routes: routes(),
    );
  }
}
