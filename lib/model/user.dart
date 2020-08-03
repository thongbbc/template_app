class User {
  int _id;
  String _userName;
  String _password;
  String _name;
  String get userName => _userName;

  set userName(String value) => _userName = value;

  String get password => _password;

  set password(String value) => _password = value;

  String get name => _name;

  set name(String value) => _name = value;

  User.initDataLogin(userName, password) {
    this._userName = userName;
    this.password = password;
  }
}
