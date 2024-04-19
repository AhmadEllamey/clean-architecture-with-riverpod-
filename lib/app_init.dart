import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInit {
  static final AppInit _appInit = AppInit._internal();

  factory AppInit() {
    return _appInit;
  }

  AppInit._internal();

  Future initBeforeAppLaunching() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await ScreenUtil.ensureScreenSize();
  }

  void initAfterAppLaunching() {}
}
