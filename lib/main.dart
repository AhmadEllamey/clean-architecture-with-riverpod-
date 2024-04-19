import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'app_init.dart';

void main() async {
  AppInit().initBeforeAppLaunching();

  runApp(
    ProviderScope(
      overrides: const [
        /// override providers if needed
      ],
      child: EasyLocalization(
        startLocale: const Locale("ar"),
        supportedLocales: const [Locale("en"), Locale("ar")],
        path: 'assets/translation',
        fallbackLocale: const Locale("ar"),
        child: const MyApp(),
      ),
    ),
  );
}