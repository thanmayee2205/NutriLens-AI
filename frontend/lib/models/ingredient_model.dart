class IngredientModel {
  final String name;
  final String risk;
  final String purpose;
  final String healthEffect;

  IngredientModel({
    required this.name,
    required this.risk,
    required this.purpose,
    required this.healthEffect,
  });

  factory IngredientModel.fromJson(
      Map<String, dynamic> json) {
    return IngredientModel(
      name: json["name"] ?? "",
      risk: json["risk"] ?? "",
      purpose: json["purpose"] ?? "",
      healthEffect:
          json["health_effect"] ?? "",
    );
  }
}