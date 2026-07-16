class IngredientValidator {
  static List<String> validate(String ingredientText) {
    if (ingredientText.trim().isEmpty) {
      return [];
    }

    final rawIngredients = ingredientText.split(",");

    final List<String> cleaned = [];

    final stopWords = [
      "NUTRITION",
      "CALORIES",
      "ENERGY",
      "PROTEIN",
      "FAT",
      "SATURATED",
      "TRANS",
      "CHOLESTEROL",
      "SODIUM",
      "CARBOHYDRATE",
      "FIBER",
      "SUGAR",
      "VITAMIN",
      "MINERAL",
      "IRON",
      "CALCIUM",
      "NET WT",
      "NET WEIGHT",
      "MRP",
      "PRICE",
      "BATCH",
      "LOT",
      "FSSAI",
      "WWW",
      "HTTP",
      "PHONE",
      "CUSTOMER CARE",
      "EMAIL",
      "BEST BEFORE",
      "EXPIRY",
      "EXPIRATION",
      "DATE",
      "MANUFACTURED",
      "MARKETED",
      "DISTRIBUTED",
      "STORE",
      "KEEP",
      "SHAKE WELL",
      "SERVING"
    ];

    for (String item in rawIngredients) {
      item = item.trim();

      if (item.isEmpty) continue;

      if (item.length < 2) continue;

      if (RegExp(r'^\d+$').hasMatch(item)) continue;

      if (RegExp(r'^\d+%$').hasMatch(item)) continue;

      bool ignore = false;

      for (final word in stopWords) {
        if (item.toUpperCase().contains(word)) {
          ignore = true;
          break;
        }
      }

      if (!ignore) {
        cleaned.add(item);
      }
    }

    return cleaned.toSet().toList();
  }
}