

import 'package:audio_player_stage/demo_data.dart';

class InputValidator {
  const InputValidator();

  static bool validate(type, String value) {
    if (type.runtimeType == InputType) {
      switch (type as InputType) {
        case InputType.email:
          return _validateEmail(value);
        case InputType.telephone:
          return _validatePhoneNumber(value);
          break;
        default:
          return true;
      }
    }
    return false;
  }

  static bool _validateEmail(String value) {
    RegExp emailRegExp = RegExp(r"(^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$)");
    return emailRegExp.hasMatch(value);
  }

  static bool _validatePhoneNumber(String value) {
    RegExp telRegExp = RegExp(r"(^(1\s?)?(\(\d{3}\)|\d{3})[\s\-]?\d{3}[\s\-]?\d{4}$)");
    return telRegExp.hasMatch(value);
  }
}