import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:templateapp/base/base_bloc.dart';
import 'package:templateapp/base/base_event.dart';
import 'package:templateapp/events/auth_event.dart';
import 'package:templateapp/model/user.dart';
import 'package:templateapp/repository/user_repo.dart';

class AuthBloc extends BaseBloc with ChangeNotifier {
  StreamController<User> _loginStreamController = StreamController<User>();
  User _userLogin;
  UserRepo userRepo;

  AuthBloc({this.userRepo});
  _login(User user) {
    _userLogin = user;
    _loginStreamController.sink.add(_userLogin);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AuthEvent) {
      print("TESTTTTTTTTTTT");
      print(event);
      User user = User.initDataLogin(event.userName, event.password);
      _login(user);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _loginStreamController.close();
  }
}
