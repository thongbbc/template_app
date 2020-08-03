import 'package:flutter/material.dart';
import 'package:templateapp/screen/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   title: Text("Template"),
        // ),
        body: new GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: LoginPage(),
        ),
      ),
    );
  }
}
