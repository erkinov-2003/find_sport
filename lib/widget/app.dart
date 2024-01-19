import 'package:find_sport/src/core/localization/app_localizations.dart';
import 'package:find_sport/src/presentation/screen/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../src/controller/controller.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainController(),
      builder: (context, child) {
        final mainController = Provider.of<MainController>(context);
        return MaterialApp(
          theme: ThemeData(useMaterial3: false),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: "Find Sport",
          locale: mainController.globalLocale,
          home: const IntroScreen(),
        );
      },
    );
  }
}
