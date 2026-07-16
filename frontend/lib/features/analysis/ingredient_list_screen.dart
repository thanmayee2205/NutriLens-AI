import 'package:flutter/material.dart';

class IngredientListScreen extends StatelessWidget {
  final List<String> ingredients;

  const IngredientListScreen({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF2E7D32);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detected Ingredients"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(
                "Detected Ingredients",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "${ingredients.length} ingredient(s) detected",
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: ingredients.length,

                  itemBuilder: (context, index) {

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),

                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade100,
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),

                        title: Text(
                          ingredients[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ),
                      ),
                    );

                  },
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  onPressed: () {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "AI Ingredient Analysis starts in Phase 8",
                        ),
                      ),
                    );

                  },

                  icon: const Icon(Icons.psychology),

                  label: const Text(
                    "Analyze with AI",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}