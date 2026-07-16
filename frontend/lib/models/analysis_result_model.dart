import 'ingredient_model.dart';

class AnalysisResultModel {
  final int healthScore;

  final String overallVerdict;

  final String recommendation;

  final List<IngredientModel> ingredients;

  AnalysisResultModel({
    required this.healthScore,
    required this.overallVerdict,
    required this.recommendation,
    required this.ingredients,
  });

  factory AnalysisResultModel.fromJson(
      Map<String, dynamic> json) {
    return AnalysisResultModel(
      healthScore: json["health_score"] ?? 0,
      overallVerdict:
          json["overall_verdict"] ?? "",
      recommendation:
          json["recommendation"] ?? "",
      ingredients:
          (json["ingredients"] as List)
              .map(
                (e) => IngredientModel.fromJson(e),
              )
              .toList(),
    );
  }
}