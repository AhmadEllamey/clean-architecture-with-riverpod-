import 'package:easy_localization/easy_localization.dart';

enum AppTexts { noData, noConnection, tryAgain, generalError, home }

extension AppTextsData on AppTexts {
  String get message {
    switch (this) {
      case AppTexts.noData:
        return 'no_data'.tr();
      case AppTexts.noConnection:
        return 'no_connection'.tr();
      case AppTexts.tryAgain:
        return 'try_again'.tr();
      case AppTexts.home:
        return 'home'.tr();
      default:
        return 'general_error'.tr();
    }
  }
}
