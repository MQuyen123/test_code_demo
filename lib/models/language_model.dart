enum AppLanguage { vi, en, jp, ko, ru, es, th }

extension AppLanguageExtension on AppLanguage {
  String get code {
    switch (this) {
      case AppLanguage.vi:
        return 'vi';
      case AppLanguage.en:
        return 'en';
      case AppLanguage.jp:
        return 'jp';
      case AppLanguage.ko:
        return 'ko';
      case AppLanguage.ru:
        return 'ru';
      case AppLanguage.es:
        return 'es';
      case AppLanguage.th:
        return 'th';
    }
  }

  String get label {
    switch (this) {
      case AppLanguage.vi:
        return 'Tiếng Việt';
      case AppLanguage.en:
        return 'English';
      case AppLanguage.jp:
        return '日本語';
      case AppLanguage.ko:
        return '한국어';
      case AppLanguage.ru:
        return 'Русский';
      case AppLanguage.es:
        return 'Español';
      case AppLanguage.th:
        return 'ภาษาไทย';
    }
  }

  String get flag {
    switch (this) {
      case AppLanguage.vi:
        return '🇻🇳';
      case AppLanguage.en:
        return '🇬🇧';
      case AppLanguage.jp:
        return '🇯🇵';
      case AppLanguage.ko:
        return '🇰🇷';
      case AppLanguage.ru:
        return '🇷🇺';
      case AppLanguage.es:
        return '🇪🇸';
      case AppLanguage.th:
        return '🇹🇭';
    }
  }
}
