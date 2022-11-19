import 'package:injectable/injectable.dart';

@LazySingleton()
class ValidatorService {
  String? alphaNumericLimit(String? text, {int? maxLength, int? minLength}) {
    if (text?.isEmpty == true) {
      return 'This field can not be empty.';
    } else {
      //RegExp regExp = RegExp(r'[!@#<>?":_.,`~;[\]\\|=+) (*&^%-]');
      RegExp regExp = RegExp(r'[^0-9-a-z-A-Z]');

      if (regExp.hasMatch(text!)) {
        return 'Please enter valid characters.';
      }
      if (maxLength != null && text.length > maxLength) {
        return 'Please enter a $maxLength digit max.';
      }
      if (minLength != null && text.length < minLength) {
        return 'Please enter a $minLength digit min.';
      }
      return null;
    }
  }

  String? onlyNumber(String? text) {
    if (text?.isEmpty == true) {
      return 'This field can not be empty.';
    } else {
      RegExp regExp = RegExp(r'[^0-9]');

      if (text?.startsWith('-') == true) {
        return 'Number must be positive!';
      }
      if (regExp.hasMatch(text!)) {
        return 'Please enter valid number.';
      }
      return null;
    }
  }
}
