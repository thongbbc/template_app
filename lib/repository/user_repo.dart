import 'package:flutter/widgets.dart';
import 'package:templateapp/services/user_service.dart';

class UserRepo {
  UserService _userService;

  UserRepo({@required UserService userService}) : _userService = userService;
}
