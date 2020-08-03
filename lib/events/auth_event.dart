import 'package:templateapp/base/base_event.dart';

class AuthEvent extends BaseEvent {
  String userName;
  String password;

  AuthEvent.loginEvent(this.userName, this.password);
}
