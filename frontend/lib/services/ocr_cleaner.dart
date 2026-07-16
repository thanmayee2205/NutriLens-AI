class OCRCleaner {
  static String clean(String text) {
    if (text.trim().isEmpty) {
      return "";
    }

    text = text.replaceAll("\r", "");
    text = text.replaceAll("\t", " ");

    text = text.replaceAll(RegExp(r'[ ]{2,}'), " ");

    text = text.replaceAll(RegExp(r'\n{2,}'), "\n");

    return text.trim();
  }
}