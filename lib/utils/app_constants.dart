import 'package:get/get.dart';

const String kRequired = 'required';
const String kOptional = 'optional';

class AppConstants {
  static const googleApiKey = 'AIzaSyDSPeDTWmjTol4rLhHw0fT9Nzrb7bAqs2M';

  static const differentCredentialMessage =
      "[firebase_auth/account-exists-with-different-credential] An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.";

  static const introText = "Search the world's information, including webpages, images, videos and more. Google has many special features to help you find exactly what you're looking for.";

  static final groupsAlertMessageLeavingPage = 'You must fill in all fields or delete unwanted ones before leaving the page'.tr;
  static final groupsAlertMessageAddGroup = 'You must fill in all fields or delete unwanted ones before adding a new group'.tr;
  static final groupsAlertMessageSave = 'All fields must be filled before saving'.tr;

  static const String facebookUrl = "https://www.facebook.com/Google/";
  static const String instagram = "https://www.instagram.com/google/";
  static const String twitterUrl = "https://twitter.com/Google?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor";

  static String get failedMessage => "Something went Wrong, try again later".tr;
  static String get requiredField => "Field is required".tr;
}
