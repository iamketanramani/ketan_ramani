class AppConstants {
  // Length Constants
  static const int contactNoMaxLength = 10;
  static const int contactNoMinLength = 10;
  static const int zipCodeMinLength = 6;
  static const int zipCodeMaxLength = 6;
  static const int passwordMinLength = 8;
  static const int priceMaxLength = 10;
  static const int otpLength = 6;
  static const int amountLength = 6;
  static const int pinCodeMaxLength = 6;
  static const int panCardLength = 10;
  static const int indianBankAcNoMinLength = 8;
  static const int indianBankAcNoMaxLength = 18;
  static const String currencySign = '₹';

  static const String defaultCountryCode = '+91';

  // Regular Expressions
  static const String regexCharactersOnly = '[a-zA-Z]';
  static const String regexCharactersWithSpace = '[a-zA-Z ]';
  static const String regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String regexGSTIN =
      r"^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$";
  static const String regexPAN = "[A-Z]{5}[0-9]{4}[A-Z]{1}";
  static const String regexIFSC = r"^[A-Z]{4}[0][A-Z0-9]{6}$";
}
