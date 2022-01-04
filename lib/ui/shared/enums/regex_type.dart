enum RegexType {
  eMail,
  onlyNumber,
  phone,
  password,
}

extension RegexTypeExtension on RegexType {
  RegExp get regex {
    switch (this) {
      case RegexType.eMail:
        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      case RegexType.onlyNumber:
        return RegExp("[0-9]");
      case RegexType.password:
        return RegExp(r'^.{6,20}$');
      case RegexType.phone:
        return RegExp("(?:[+])[0-9]{12}");
    }
  }
}
