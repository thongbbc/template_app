import 'package:templateapp/screen/login.dart';

typedef Constructor<T> = T Function();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<LoginPage>(() => LoginPage());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
