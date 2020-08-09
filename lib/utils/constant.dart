import 'package:flutter/material.dart';

mixin ConfigSystems {
  static String baseUrl = 'http://Sallyapi.ijs.network:8080/api';
  static String requiresToken = 'requirestoken';
  static String token = 'token';
  static String cookie = 'Cookie';
}

class SPrefCache {
  // ignore: constant_identifier_names
  static const KEY_TOKEN = 'key_token';
  // ignore: constant_identifier_names
  static const KEY_COOKIE = 'key_cookie';
  // ignore: constant_identifier_names
  static const KEY_USER = 'key_user';
}

mixin PathAPI {
  static String userLogin = "/user/login";
  static String userProfile = "/user/profile";
}

class GlobalVariable {
  // static String phone = null;
  // static String fullname = null;
  // static String token = null;
}

mixin AppImage {
  static String backgroundLogin = "assets/images/login.png";
}

/*
* How to use:
* FontStyle(family: "NAME_OF_FONT_FAMILY").
* regular().
* copyWith({other prop like color, font size })
*
* That use family = PingFang =>
* FontStyle().
* regular().
* copyWith({other prop like color, font size })
* */
class FontStyle {
  final String family;

  const FontStyle({this.family = "Poppins"});

  TextStyle regular() {
    return TextStyle(
      fontFamily: family,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle medium() {
    return TextStyle(
      fontFamily: family,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle bold() {
    return TextStyle(
      fontFamily: family,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle extraLight() {
    return TextStyle(
      fontFamily: family,
      fontWeight: FontWeight.w200,
    );
  }

  TextStyle heavy() {
    return TextStyle(
      fontFamily: family,
      fontWeight: FontWeight.w800,
    );
  }

  TextStyle light() {
    return TextStyle(
      fontFamily: family,
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle semiBold() {
    return TextStyle(
      fontFamily: family,
      fontWeight: FontWeight.w600,
    );
  }
}
