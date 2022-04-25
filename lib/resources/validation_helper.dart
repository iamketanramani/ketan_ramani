import 'package:flutter/services.dart';
import 'package:ketan_ramani/resources/app_constants.dart';
import 'package:ketan_ramani/resources/app_strings.dart';

class ValidationHelper {
  static List<TextInputFormatter> allowCharactersOnly = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(AppConstants.regexCharactersOnly))
  ];

  static List<TextInputFormatter> allowCharactersWithSpace =
      <TextInputFormatter>[
    FilteringTextInputFormatter.allow(
        RegExp(AppConstants.regexCharactersWithSpace))
  ];

  static List<TextInputFormatter> allowDigitsOnly = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
  ];

  static List<TextInputFormatter> ifscOnly = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(AppConstants.regexIFSC))
  ];

  static dynamic isBasicValidation(String name) {
    if (name.isEmpty) {
      return AppStrings.strRequiredField;
    } else {
      return null;
    }
  }

  static dynamic isValidName(String name) {
    if (name.isEmpty) {
      return AppStrings.strRequiredField;
    } else if (name.length < 2) {
      return AppStrings.strNameNotValid;
    } else {
      return null;
    }
  }

  static dynamic isValidEmail(String email) {
    if (email.isEmpty) {
      return AppStrings.strRequiredField;
    } else if (!RegExp(AppConstants.regexEmail).hasMatch(email)) {
      return AppStrings.strEnterValidEmail;
    } else {
      return null;
    }
  }

  static dynamic isValidContactNo(String contactNo) {
    if (contactNo.isEmpty) {
      return AppStrings.strRequiredField;
    } else if (contactNo.length < AppConstants.contactNoMinLength) {
      return AppStrings.strContactNoInvalid;
    } else {
      return null;
    }
  }
/*
  static dynamic isValidOTP(String otp, int length) {
    if (otp.isEmpty) {
      return AppConstants.strRequiredField;
    } else if (otp.length < length) {
      return AppConstants.strPaytmOTPInvalid;
    } else {
      return null;
    }
  }

  static dynamic isValidPan(String pan) {
    if (pan.isEmpty) {
      return AppConstants.strRequiredField;
    } else if (pan.length < AppConstants.panCardLength) {
      return AppConstants.strEnterValidPan;
    } else if (!RegExp(AppConstants.regexPAN).hasMatch(pan)) {
      return AppConstants.strInvalidPan;
    } else {
      return null;
    }
  }

  static bool _isStrongPassword(String password) {
    if (!password.contains(RegExp(r"[a-z]"))) return false;
    if (!password.contains(RegExp(r"[A-Z]"))) return false;
    if (!password.contains(RegExp(r"[0-9]"))) return false;
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return false;
    return true;
  } */

  /* static dynamic isValidPassword(String password) {
    if (password.isEmpty) {
      return AppConstants.strRequiredField;
    } else if (password.length < AppConstants.passwordMinLength) {
      return AppConstants.strPasswordInvalid;
    } else if (!_isStrongPassword(password)) {
      return AppConstants.strStrongPassword;
    } else {
      return null;
    }
  }

  static dynamic isValidConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return AppConstants.strRequiredField;
    } else if (password != confirmPassword) {
      return AppConstants.strPasswordNotMatch;
    } else {
      return null;
    }
  } */

  static bool isValidString(String? strToValidate) {
    bool result = false;

    if (strToValidate != null &&
        strToValidate.trim() != 'null' &&
        strToValidate.trim().isNotEmpty) {
      result = true;
    }

    return result;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
