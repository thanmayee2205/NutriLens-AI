import 'analysis_result_model.dart';

class ScanHistoryModel {
  final String id;

  final String productName;

  final String ocrText;

  final DateTime scannedAt;

  final AnalysisResultModel analysis;

  ScanHistoryModel({
    required this.id,
    required this.productName,
    required this.ocrText,
    required this.scannedAt,
    required this.analysis,
  });
}