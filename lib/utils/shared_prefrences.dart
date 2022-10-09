import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static const String keyIsLogIn = "key_isLogIn";
  static const String keyAccessToken = "key_access_token";
  static const String keyEmail = "key_email";
  static const String keyFname = "key_Fname";
  static const String keyLname = "key_Lname";
  static const String keyId = "key_id";
  static const String keyIsPassedIntro = "key_is_passed_intro";
  static const String keyLanguage = "key_language";
  static const String keyDeviceToken = "key_device_token";
  static const String keyUserImage = "key_user_image";
  static const String keyUserNumber = "key_user_Number";

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void clearProfile() {
    accessToken = "";
    isLogIn = false;
    email = "";
    fName = "";
    lName = "";
    id = 0;
    isPassedIntro = false;
    language = "";
    deviceToken = "";
    userImage = '';
    userNumber = '';
  }

  static String get accessToken => _sharedPreferences.getString(keyAccessToken) ?? "";
  static set accessToken(String value) => _sharedPreferences.setString(keyAccessToken, value);

  static bool get isLogIn => _sharedPreferences.getBool(keyIsLogIn) ?? false;
  static set isLogIn(bool value) => _sharedPreferences.setBool(keyIsLogIn, value);

  static bool get isPassedIntro => _sharedPreferences.getBool(keyIsPassedIntro) ?? false;
  static set isPassedIntro(bool value) => _sharedPreferences.setBool(keyIsPassedIntro, value);

  static String get language => _sharedPreferences.getString(keyLanguage) ?? "";
  static set language(String value) => _sharedPreferences.setString(keyLanguage, value);

  static String get email => _sharedPreferences.getString(keyEmail) ?? "";
  static set email(String value) => _sharedPreferences.setString(keyEmail, value);

  static String get fName => _sharedPreferences.getString(keyFname) ?? "";
  static set fName(String value) => _sharedPreferences.setString(keyFname, value);

  static String get lName => _sharedPreferences.getString(keyLname) ?? "";
  static set lName(String value) => _sharedPreferences.setString(keyLname, value);

  static int get id => _sharedPreferences.getInt(keyId) ?? 0;
  static set id(int value) => _sharedPreferences.setInt(keyId, value);

  static String get deviceToken => _sharedPreferences.getString(keyDeviceToken) ?? "";
  static set deviceToken(String value) => _sharedPreferences.setString(keyDeviceToken, value);

  static String get userImage => _sharedPreferences.getString(keyUserImage) ?? "";
  static set userImage(String value) => _sharedPreferences.setString(keyUserImage, value);

  static String get userNumber => _sharedPreferences.getString(keyUserNumber) ?? "";
  static set userNumber(String value) => _sharedPreferences.setString(keyUserNumber, value);
}
