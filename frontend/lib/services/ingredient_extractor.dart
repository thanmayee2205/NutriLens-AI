class IngredientExtractor {
  static String extract(String cleanedText) {
    if (cleanedText.trim().isEmpty) {
      return "";
    }

    final text = cleanedText;

    final startKeywords = [
      "INGREDIENTS:",
      "INGREDIENTS",
      "INGREDIENT:",
      "INGREDIENT",
      "CONTAINS:",
      "CONTAINS"
    ];

    final endKeywords = [
      "NUTRITION FACTS",
      "NUTRITION INFORMATION",
      "MANUFACTURED BY",
      "MARKETED BY",
      "DISTRIBUTED BY",
      "IMPORTER",
      "STORAGE",
      "STORAGE INSTRUCTIONS",
      "DIRECTIONS",
      "BEST BEFORE",
      "EXPIRY",
      "EXPIRATION",
      "NET WEIGHT",
      "FSSAI",
      "CUSTOMER CARE",
      "PHONE",
      "WWW.",
      "HTTP",
      "ALLERGEN",
      "WARNING"
    ];

    String upper = text.toUpperCase();

    int startIndex = -1;

    for (String keyword in startKeywords) {
      startIndex = upper.indexOf(keyword);

      if (startIndex != -1) {
        startIndex += keyword.length;
        break;
      }
    }

    if (startIndex == -1) {
      return text;
    }

    String ingredientSection = text.substring(startIndex);

    String upperSection = ingredientSection.toUpperCase();

    int endIndex = upperSection.length;

    for (String keyword in endKeywords) {
      final index = upperSection.indexOf(keyword);

      if (index != -1 && index < endIndex) {
        endIndex = index;
      }
    }

    ingredientSection = ingredientSection.substring(0, endIndex);

    return ingredientSection.trim();
  }
}