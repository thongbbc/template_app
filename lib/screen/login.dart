import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:templateapp/base/base_widget.dart';
import 'package:templateapp/bloc/auth_bloc.dart';
import 'package:templateapp/repository/user_repo.dart';
import 'package:templateapp/services/user_service.dart';
import 'package:templateapp/widgets/background.dart';
import 'package:templateapp/widgets/textinput.dart';
import 'package:templateapp/widgets/titleBox.dart';

class LoginPage extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    final mq = MediaQueryData.fromWindow(window);
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          AuthBloc(userRepo: Provider.of(context)),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: mq.size.height,
          ),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: BackgroundImage(
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
                            TextInput(),
                            SizedBox(height: 10),
                            TextInput(),
                            SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                onPressed: () {},
                                child: Text('LOGIN'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
