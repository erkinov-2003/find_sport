import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get language => 'Язык';

  @override
  String get first_name => 'Имя';

  @override
  String get last_name => 'Фамилия';

  @override
  String get phone_number => 'Номер телефона';

  @override
  String get password => 'Пароль';

  @override
  String get confirm_password => 'Подтвердите пароль';

  @override
  String get sign_up => 'Регистрация';
}
