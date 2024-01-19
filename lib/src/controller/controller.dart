import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
  Future navigationPages(BuildContext context, Widget widget) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  Locale globalLocale = const Locale("uz");

  void onPressedUz(Locale newLocale) {
    globalLocale = newLocale;
    notifyListeners();
  }

  void onPressedEng(Locale newLocale) {
    globalLocale = newLocale;
    notifyListeners();
  }

  void onPressedRu(Locale newLocale) {
    globalLocale = newLocale;
    notifyListeners();
  }
}
