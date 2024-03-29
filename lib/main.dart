import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core_9615/core/config/DI/configure_dependencies.dart';
import 'package:flutter_core_9615/core/config/routes/router.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

Future<void> main() async {
  await configureDependencies();
  // For disable logger, change Build Modes in [Easy Logger] to empty List;
  EasyLocalization.logger.enableBuildModes = [];
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      //set up theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //set up localization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //set up navigation
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: (settings) => AppRoute.routeGenerate(settings, this),
      initialRoute: AppRoute.initialRoute,
      //disable debug
      debugShowCheckedModeBanner: false,
    );
  }
}
