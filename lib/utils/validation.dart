class Validation {
  static isUserNameValid(String userName) {
    return userName.length > 5;
  }

  static isPassValid(String pass) {
    return pass.length >= 6;
  }
}
