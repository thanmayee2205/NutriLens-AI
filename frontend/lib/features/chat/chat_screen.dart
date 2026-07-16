import 'package:flutter/material.dart';

import '../../core/data/app_data.dart';
import '../../models/analysis_result_model.dart';
import '../../models/chat_message.dart';
import '../../services/chat_service.dart';

class ChatScreen extends StatefulWidget {
  final AnalysisResultModel result;

  const ChatScreen({
    super.key,
    required this.result,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<ChatMessage> messages = [];

  bool isLoading = false;

  String buildAnalysisText() {
    final ingredientSummary = widget.result.ingredients
        .map((e) => "${e.name} (${e.risk})")
        .join(", ");

    return """
Health Score: ${widget.result.healthScore}

Overall Verdict:
${widget.result.overallVerdict}

Recommendation:
${widget.result.recommendation}

Ingredients:
$ingredientSummary
""";
  }

  Future<void> sendMessage() async {
    if (_controller.text.trim().isEmpty) return;

    final question = _controller.text.trim();

    setState(() {
      messages.add(
        ChatMessage(
          message: question,
          isUser: true,
        ),
      );

      isLoading = true;
    });

    _controller.clear();

    try {
      final answer = await ChatService.askAI(
        question: question,
        productAnalysis: buildAnalysisText(),
        age: currentUser.age,
        gender: currentUser.gender,
        medicalConditions: [
          if (currentUser.diabetes) "Diabetes",
          if (currentUser.hypertension) "Hypertension",
          if (currentUser.cholesterol) "High Cholesterol",
        ],
        allergies: currentUser.allergies,
        dietPreferences: [
          currentUser.dietPreference,
        ],
      );

      setState(() {
        messages.add(
          ChatMessage(
            message: answer,
            isUser: false,
          ),
        );
      });
    } catch (e) {
      setState(() {
        messages.add(
          ChatMessage(
            message: "Unable to contact AI.",
            isUser: false,
          ),
        );
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask NutriLens AI"),
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];

                return Align(
                  alignment: message.isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: message.isUser
                          ? Colors.green
                          : Colors.grey.shade300,
                      borderRadius:
                          BorderRadius.circular(14),
                    ),
                    child: Text(
                      message.message,
                      style: TextStyle(
                        color: message.isUser
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(12),
              child: CircularProgressIndicator(),
            ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [

                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Ask anything...",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  IconButton(
                    onPressed: isLoading
                        ? null
                        : sendMessage,
                    icon: const Icon(Icons.send),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}