import 'package:flutter/cupertino.dart';
import 'package:templateapp/screen/login.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    LoginPage.id: (context) => LoginPage(),
  };
}

Future<void> nextPageAndRemovePrevious(BuildContext context, String path) {
  return Navigator.pushReplacementNamed(context, path);
}

Future<void> nextPage(BuildContext context, String path) {
  return Navigator.pushNamed(context, path);
}
