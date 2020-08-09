import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:templateapp/base/base_bloc.dart';
import 'package:templateapp/base/base_event.dart';
import 'package:templateapp/events/auth_event.dart';
import 'package:templateapp/repository/user_repo.dart';
import 'package:templateapp/utils/validation.dart';

class AuthBloc extends BaseBloc with ChangeNotifier {
  final _userNameSubject = BehaviorSubject<String>();
  final _passSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();
  UserRepo _userRepo;

  AuthBloc({@required UserRepo userRepo}) {
    this._userRepo = userRepo;
    validateForm();
  }

  var userNameValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (userName, sink) {
    if (Validation.isUserNameValid(userName)) {
      sink.add(null);
      return;
    }
    sink.add('Username invalid');
  });

  var passValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    if (Validation.isPassValid(pass)) {
      sink.add(null);
      return;
    }
    sink.add('Password too short');
  });

  Stream<String> get userNameStream =>
      _userNameSubject.stream.transform(userNameValidation);
  Sink<String> get userNameSink => _userNameSubject.sink;
  Stream<String> get passStream =>
      _passSubject.stream.transform(passValidation);
  Sink<String> get passSink => _passSubject.sink;
  Stream<bool> get btnStream => _btnSubject.stream;
  Sink<bool> get btnSink => _btnSubject.sink;

  validateForm() {
    Observable.combineLatest2(
      _userNameSubject,
      _passSubject,
      (userName, pass) {
        return Validation.isUserNameValid(userName) &&
            Validation.isPassValid(pass);
      },
    ).listen((enable) {
      btnSink.add(enable);
    });
  }

  _handleLogin(event) {
    btnSink.add(false);
    Future.delayed(Duration(seconds: 6), () {
      btnSink.add(true);
    });
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AuthEvent) {
      _handleLogin(event);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _userNameSubject.close();
    _passSubject.close();
    _btnSubject.close();
  }
}
