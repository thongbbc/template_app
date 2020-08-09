import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:templateapp/base/base_event.dart';
import 'package:templateapp/base/base_widget.dart';
import 'package:templateapp/bloc/auth_bloc.dart';
import 'package:templateapp/events/auth_event.dart';
import 'package:templateapp/repository/user_repo.dart';
import 'package:templateapp/services/user_service.dart';
import 'package:templateapp/widgets/background.dart';
import 'package:templateapp/widgets/bloc_listener.dart';
import 'package:templateapp/widgets/textinput.dart';
import 'package:templateapp/widgets/titleBox.dart';

class LoginPage extends StatelessWidget {
  static const String id = "LoginPage";
  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: 'Login In',
      di: [
        Provider.value(
          value: UserService(),
        ),
        ProxyProvider<UserService, UserRepo>(
          update: (context, userService, previous) =>
              UserRepo(userService: userService),
        ),
      ],
      bloc: [],
      child: LoginFormWidget(),
    );
  }
}

class LoginFormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  callBack(BaseEvent event) {}
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthBloc(
        userRepo: Provider.of(context, listen: false),
      ),
      child: Consumer<AuthBloc>(
        builder: (context, bloc, child) {
          return BlocListener<AuthBloc>(
              listener: callBack, child: _buildContainer(bloc));
        },
      ),
    );
  }

  Widget _buildContainer(AuthBloc bloc) {
    final mq = MediaQueryData.fromWindow(window);
    return BackgroundView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            children: [
              TitleBox(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildUserNameField(bloc),
                    SizedBox(height: 10),
                    _buildPasswordField(bloc),
                    SizedBox(height: 20),
                    _buildButtonLogin(bloc),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonLogin(AuthBloc bloc) {
    return StreamProvider<bool>.value(
      initialData: false,
      value: bloc.btnStream,
      builder: (context, snapshot) {
        return Consumer<bool>(
          builder: (context, enable, child) {
            return SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: enable
                    ? () {
                        bloc.event.add(
                          AuthEvent.loginEvent(_userNameController.text,
                              _passwordController.text),
                        );
                      }
                    : null,
                child: Text('LOGIN'),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildUserNameField(AuthBloc bloc) {
    return StreamProvider<String>.value(
        initialData: null,
        value: bloc.userNameStream,
        child: Consumer<String>(
          builder: (context, msg, child) {
            return TextInput(
              hintText: "Username",
              errorText: msg,
              icon: Icons.supervised_user_circle,
              controller: _userNameController,
              onChanged: (text) {
                bloc.userNameSink.add(text);
              },
            );
          },
        ));
  }

  Widget _buildPasswordField(AuthBloc bloc) {
    return StreamProvider<String>.value(
        initialData: null,
        value: bloc.passStream,
        child: Consumer<String>(
          builder: (context, msg, child) {
            return TextInput(
              hintText: "Password",
              icon: Icons.lock_open,
              controller: _passwordController,
              errorText: msg,
              onChanged: (text) {
                bloc.passSink.add(text);
              },
            );
          },
        ));
  }
}
