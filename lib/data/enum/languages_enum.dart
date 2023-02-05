enum Languages {
  vn,
  en,
  kor,
}

extension ExtensionLanguages on Languages {
  String getStringLanguage() {
    switch (this) {
      case Languages.vn:
        return 'vn';
      case Languages.en:
        // TODO: Handle this case.
        return 'en';
      case Languages.kor:
        // TODO: Handle this case.
        return 'kor';
      default:
        return 'vn';
    }
  }
}
