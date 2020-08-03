import 'package:flutter/material.dart';
import 'package:templateapp/constants/constant.dart';

class TitleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Co",
          style: kH1TextStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w100,
              fontStyle: FontStyle.italic),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Text(
                "f",
                style: kH3TextStyle.copyWith(color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  "fee",
                  style: kH3TextStyle.copyWith(color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35),
                child: Text(
                  "Shop",
                  style: kH3TextStyle.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
