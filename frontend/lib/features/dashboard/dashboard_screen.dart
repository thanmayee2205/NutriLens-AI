import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF2E7D32);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          "NutriLens AI",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(
                "Good Morning 👋",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Welcome to NutriLens AI",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: primaryGreen,
                  borderRadius: BorderRadius.circular(18),
                ),

                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Today's Health Score",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "--",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Complete your profile to calculate your score.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 30),
                            Row(
                children: [

                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.document_scanner_outlined,
                      title: "Total Scans",
                      value: "0",
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.verified_outlined,
                      title: "Healthy",
                      value: "0",
                      color: Colors.green,
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [

                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.warning_amber_rounded,
                      title: "Avoid",
                      value: "0",
                      color: Colors.orange,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.history,
                      title: "History",
                      value: "0",
                      color: Colors.purple,
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 35),

              const Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Food Scanner will be implemented in Phase 6",
                        ),
                      ),
                    );

                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text(
                    "Scan Food Label",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "Recent Activity",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.info_outline),
                  ),
                  title: Text("No scans available"),
                  subtitle: Text(
                    "Your scanned products will appear here.",
                  ),
                ),
              ),

              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {

    return Card(

      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          children: [

            Icon(
              icon,
              size: 34,
              color: color,
            ),

            const SizedBox(height: 12),

            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              title,
              textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
    );
  }
}