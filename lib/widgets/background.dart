import 'dart:ui';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackgroundView extends StatelessWidget {
  Function onTap;
  Widget child;
  BackgroundView({@required this.child, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
          return FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/login.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 1.0),
                child: new Container(
                  decoration:
                      new BoxDecoration(color: Colors.black.withOpacity(0.2)),
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                    Color(0x232526).withOpacity(0.5),
                    Color(0x414345).withOpacity(0.5),
                  ])),
            ),
            Container(child: this.child)
          ],
        ));
  }
}
