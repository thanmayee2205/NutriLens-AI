import '../models/scan_history_model.dart';

class ScanHistoryService {
  static final List<ScanHistoryModel> _history = [];

  static List<ScanHistoryModel> getHistory() {
    return List.unmodifiable(_history.reversed);
  }

  static void addScan(ScanHistoryModel scan) {
    _history.add(scan);
  }

  static void clearHistory() {
    _history.clear();
  }

  static int totalScans() {
    return _history.length;
  }

  static int healthyProducts() {
    return _history
        .where((scan) => scan.analysis.healthScore >= 70)
        .length;
  }

  static int avoidProducts() {
    return _history
        .where((scan) => scan.analysis.healthScore < 40)
        .length;
  }

  static int latestHealthScore() {
    if (_history.isEmpty) return 0;
    return _history.last.analysis.healthScore;
  }
}