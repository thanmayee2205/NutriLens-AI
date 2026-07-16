import 'package:flutter/material.dart';

import '../../database/scan_history_service.dart';
import '../analysis/analysis_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = ScanHistoryService.getHistory();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan History"),
      ),
      body: history.isEmpty
          ? const Center(
              child: Text(
                "No scans yet.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final scan = history[index];

                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      scan.analysis.healthScore.toString(),
                    ),
                  ),

                  title: Text(
                    scan.productName,
                  ),

                  subtitle: Text(
                    scan.scannedAt.toString(),
                  ),

                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AnalysisScreen(
                          result: scan.analysis,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}