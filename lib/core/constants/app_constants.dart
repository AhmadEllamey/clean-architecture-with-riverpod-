import 'package:flutter/widgets.dart';

class AppConstants {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static const fontFamily = "Bahij_TheSansArabic";
  static String? currentAppRoute = "/";
  static String phone = "${phoneCode}533357845";
  static double addedValue = 15;
  static String mapKey = "AIzaSyANo2GYk-GzAV3Q4UA5PGW0KrN9lGFbyrY";
  // my google map account --> "AIzaSyANo2GYk-GzAV3Q4UA5PGW0KrN9lGFbyrY";
  // guapa google map account --> "AIzaSyAurQCv1a-kbEQawVAIpgPWxlD5LzOpv8M";

  static double taxes = 0 / 100;

  static void setTaxes(double taxesPercentage) {
    taxes = taxesPercentage / 100;
  }

  static String doNotInterceptKey = "do_not_intercept";
  static String authorizationRequired = "authorization_required";
  static String wpApiKey = "WP_API";
  static String uploadImageKey = "upload_image";

  static int timer({required int seconds}) {
    return DateTime.now().millisecondsSinceEpoch + 1000 * seconds;
  }

  static bool isKSA = true;

  static String phoneCode = isKSA ? "+966" : "+20";
  static int phoneLength = isKSA ? 10 : 11;

  // static String phoneCode = "+966";
  // static int phoneLength = 10;

  static bool validatePhone({required String phone}) {
    if (isKSA) {
      return validatePhoneKSA(phone: phone);
    }
    return validatePhoneEG(phone: phone);
  }

  static String getUserPhone({required String phone}) {
    try {
      if (isKSA) {
        return getUserPhoneKSA(phone: phone);
      }
      return getUserPhoneEG(phone: phone);
    } catch (e) {
      return phone;
    }
  }

  static String _firebaseToken = "";

  static void setFirebaseToken(String value) {
    _firebaseToken = value;
  }

  static String getFirebaseToken() {
    return _firebaseToken;
  }

  static bool validatePhoneEG({required String phone}) {
    // +20 code
    // 1061619332 ---> count is 10
    // the user could enter 11 digits
    // if the first digit is zero delete it before the validation
    // validate the phone with
    // 1 - length should be = 10
    // 2 - the first 4 digits should contain any numbers from 1 to 9
    // phone should be
    if (phone.length == 10 || phone.length == 11) {
      if (phone.startsWith("0")) {
        // this means we need to remove the first zero
        phone = phone.substring(1);
        debugPrint("the phone after cutting zero $phone");
      }
      if (phone.length == 10) {
        String leading = phone.substring(0, 4);
        if (leading.contains("1") ||
            leading.contains("2") ||
            leading.contains("3") ||
            leading.contains("4") ||
            leading.contains("5") ||
            leading.contains("6") ||
            leading.contains("7") ||
            leading.contains("8") ||
            leading.contains("9")) {
          return true;
        }
      }
    }
    return false;
  }

  static bool validatePhoneKSA({required String phone}) {
    // +966 code
    // city code like (011,012,013,014)
    // xx-x-xxx-xxx ---> count is 9
    // the user could enter 10 digits
    // if the first digit is zero delete it before the validation
    // validate the phone with
    // 1 - length should be = 9
    // 2 - the first 4 digits should contain any numbers from 1 to 9
    // phone should be
    if (phone.length == 9 || phone.length == 10) {
      if (phone.startsWith("0")) {
        // this means we need to remove the first zero
        phone = phone.substring(1);
        debugPrint("the phone after cutting zero $phone");
      }
      if (phone.length == 9) {
        String leading = phone.substring(0, 4);
        if (leading.contains("1") ||
            leading.contains("2") ||
            leading.contains("3") ||
            leading.contains("4") ||
            leading.contains("5") ||
            leading.contains("6") ||
            leading.contains("7") ||
            leading.contains("8") ||
            leading.contains("9")) {
          return true;
        }
      }
    }
    return false;
  }

  static String getUserPhoneEG({required String phone}) {
    try {
      return phone.substring(3);
    } catch (e) {
      return phone;
    }
  }

  static String getUserPhoneKSA({required String phone}) {
    try {
      return phone.substring(4);
    } catch (e) {
      return phone;
    }
  }
}
