import 'package:flutter/material.dart';

import '../../models/analysis_result_model.dart';
import '../../services/history_service.dart';
import '../chat/chat_screen.dart';

class AnalysisScreen extends StatefulWidget {
  final AnalysisResultModel result;

  const AnalysisScreen({
    super.key,
    required this.result,
  });

  @override
  State<AnalysisScreen> createState() =>
      _AnalysisScreenState();
}

class _AnalysisScreenState
    extends State<AnalysisScreen> {

  @override
  void initState() {
    super.initState();
    saveScan();
  }

  Future<void> saveScan() async {
    await HistoryService.saveHistory({
      "healthScore": widget.result.healthScore,
      "overallVerdict":
          widget.result.overallVerdict,
      "recommendation":
          widget.result.recommendation,
      "ingredients": widget.result.ingredients
          .map(
            (e) => {
              "name": e.name,
              "risk": e.risk,
            },
          )
          .toList(),
      "date":
          DateTime.now().toIso8601String(),
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen =
        Color(0xFF2E7D32);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AI Food Analysis",
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Center(
                child: Column(
                  children: [

                    const Text(
                      "Health Score",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    CircleAvatar(
                      radius: 60,
                      backgroundColor:
                          primaryGreen,

                      child: Text(
                        "${widget.result.healthScore}",

                        style:
                            const TextStyle(
                          color:
                              Colors.white,
                          fontSize: 34,
                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    Text(
                      widget
                          .result
                          .overallVerdict,

                      textAlign:
                          TextAlign.center,

                      style:
                          const TextStyle(
                        fontSize: 16,
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              ...widget.result.ingredients.map(
                (ingredient) {
                                    Color color;

                  switch (ingredient.risk.toLowerCase()) {
                    case "safe":
                      color = Colors.green;
                      break;

                    case "moderate":
                      color = Colors.orange;
                      break;

                    default:
                      color = Colors.red;
                  }

                  return Card(
                    margin:
                        const EdgeInsets.only(
                            bottom: 15),

                    child: Padding(
                      padding:
                          const EdgeInsets.all(
                              16),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          Row(
                            children: [

                              Icon(
                                Icons.circle,
                                size: 14,
                                color: color,
                              ),

                              const SizedBox(
                                width: 10,
                              ),

                              Expanded(
                                child: Text(
                                  ingredient.name,
                                  style:
                                      const TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),
                              ),

                              Chip(
                                label: Text(
                                  ingredient.risk,
                                ),
                              ),

                            ],
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          const Text(
                            "Purpose",
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          Text(
                            ingredient.purpose,
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          const Text(
                            "Health Effect",
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          Text(
                            ingredient.healthEffect,
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              const Text(
                "Recommendation",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.all(
                          16),

                  child: Text(
                    widget.result.recommendation,
                  ),
                ),
              ),

              const SizedBox(height: 30),
                            SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.smart_toy,
                  ),

                  label: const Text(
                    "Ask NutriLens AI",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        primaryGreen,
                    foregroundColor:
                        Colors.white,
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              14),
                    ),
                  ),

                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ChatScreen(
                          result:
                              widget.result,
                        ),
                      ),
                    );

                  },
                ),
              ),

              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}