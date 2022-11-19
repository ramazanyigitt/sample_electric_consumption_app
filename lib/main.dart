import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'data/localization/messages.dart';

import 'features/splash/splash_view.dart';
import 'shared/app_theme.dart';

import 'core/utils/router/app_router.dart';
import 'injection/injection_container.dart' as di;

Future<void> main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await di.configureDependencies();

    await Get.updateLocale(Get.deviceLocale ?? const Locale('en', 'US'));

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      log('Error: $details', name: 'runZone');
    };
    runApp(
      const StipraApplication(),
    );
  }, (Object error, StackTrace stack) {
    log('Error: $error', name: 'FMain');
  });
}

class StipraApplication extends StatelessWidget {
  const StipraApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) => GetMaterialApp(
        translations: Messages(),
        locale: Get.locale,
        fallbackLocale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        navigatorKey: AppRouter().mainNavigatorKey,
        theme: ThemeData(
          primaryColor: AppTheme().primaryColor,
        ),
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
      ),
    );
  }
}
