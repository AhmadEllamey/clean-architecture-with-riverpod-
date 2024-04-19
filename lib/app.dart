import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_init.dart';
import 'core/constants/app_constants.dart';
import 'core/route_generator.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) async {
    MyAppState? state = context.findAncestorStateOfType<MyAppState>();
    state?.changeLanguage(newLocale);
  }

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;
  Locale? _locale = const Locale("ar");

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      AppInit().initAfterAppLaunching();
    });
  }

  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: _locale,
            navigatorKey: AppConstants.navigatorKey,
            localizationsDelegates: [
              ...context.localizationDelegates,
            ],
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1,
                ), //, devicePixelRatio: 3.5
                //set desired text scale factor here
                child: child!,
              );
            },
            themeMode: ThemeMode.light,
            //initialRoute: SplashScreen.routeName,
            onGenerateRoute: (routeSettings) =>
                RouteGenerator.generateRoute(routeSettings),
          );
        });
  }
}
