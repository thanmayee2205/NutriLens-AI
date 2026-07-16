class IngredientParser {
  static List<String> parseIngredients(String rawText) {
    if (rawText.trim().isEmpty) {
      return [];
    }

    String text = rawText.toUpperCase();

    text = text.replaceAll("\n", " ");

    text = text.replaceAll(RegExp(r'\s+'), " ");

    text = text.replaceAll("INGREDIENTS:", "");
    text = text.replaceAll("INGREDIENTS", "");
    text = text.replaceAll("INGREDIENT", "");

    final List<String> pieces = text.split(",");

    final List<String> ignoredWords = [

      "WWW",

      "HTTP",

      ".COM",

      "PHONE",

      "CALL",

      "ATLANTA",

      "COMPANY",

      "COCA-COLA",

      "MEMBER",

      "BOTTLERS",

      "CONSUMER",

      "CALORIES",

      "CALORIE",

      "FAT",

      "CHOLESTEROL",

      "FIBER",

      "SODIUM",

      "PROTEIN",

      "SUGAR",

      "SERVING",

      "VITAMIN",

      "IRON",

      "CALCIUM",

      "DIET",

      "%",

      "201",

      "202",

      "203",

      "204",

      "205",

    ];

    List<String> cleaned = [];

    for (String item in pieces) {
      item = item.trim();

      if (item.isEmpty) continue;

      bool ignore = false;

      for (String word in ignoredWords) {
        if (item.contains(word)) {
          ignore = true;
          break;
        }
      }

      if (ignore) continue;

      if (RegExp(r'^\d+$').hasMatch(item)) {
        continue;
      }

      if (item.length < 4) {
        continue;
      }

      cleaned.add(item);
    }

    return cleaned.toSet().toList();
  }
}