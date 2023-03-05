import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'App/Services/services_locator.dart' as di;
import 'App/index.dart';
import 'Configs/app_localizations.dart';
import 'Routes/index.dart';
import 'Themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
      await getSettings();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePages.intial,
      onGenerateRoute: Routes.onGenerateRoute,
      theme: AppTheme.lightTheme,
      scrollBehavior: MyCustomScrollBehavior(),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (AppLocalizations.defaultLocale != null) {
          return AppLocalizations.defaultLocale;
        } else {
          for (var locale in supportedLocales) {
            if (deviceLocale != null &&
                deviceLocale.languageCode == locale.languageCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        }
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
