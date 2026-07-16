import 'package:flutter/material.dart';

import '../../core/data/app_data.dart';
import '../../database/scan_history_service.dart';
import '../health_profile/personal_details_screen.dart';
import '../history/history_screen.dart';
import '../scanner/scanner_screen.dart';
import '../../services/auth_service.dart';
import '../authentication/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState
    extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {

    const Color primaryGreen =
        Color(0xFF2E7D32);

    return Scaffold(

      backgroundColor:
          const Color(0xFFF7F9F8),

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

  actions: [

    IconButton(
      icon: const Icon(Icons.logout),

      onPressed: () async {

        await AuthService.logout();

        if (!context.mounted) return;

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
          (route) => false,
        );

      },
    ),

  ],
),

      body: SafeArea(

        child: SingleChildScrollView(

          padding:
              const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

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

                  fontWeight:
                      FontWeight.bold,

                ),
              ),

              const SizedBox(height: 25),

              Container(

                width: double.infinity,

                padding:
                    const EdgeInsets.all(20),

                decoration: BoxDecoration(

                  color: primaryGreen,

                  borderRadius:
                      BorderRadius.circular(18),

                ),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(

                      "Today's Health Score",

                      style: TextStyle(

                        color:
                            Colors.white70,

                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(

                      ScanHistoryService
                                  .totalScans() ==
                              0
                          ? "--"
                          : ScanHistoryService
                              .latestHealthScore()
                              .toString(),

                      style: const TextStyle(

                        color: Colors.white,

                        fontSize: 42,

                        fontWeight:
                            FontWeight.bold,

                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(

                      currentUser
                              .fullName
                              .isEmpty
                          ? "Complete your profile to calculate your score."
                          : "Welcome ${currentUser.fullName}!",

                      style:
                          const TextStyle(

                        color:
                            Colors.white,

                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(

                      width: double.infinity,

                      height: 48,

                      child:
                          ElevatedButton(

                        onPressed:
                            () async {

                          await Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder:
                                  (_) =>
                                      const PersonalDetailsScreen(),

                            ),

                          );

                          if (mounted) {

                            setState(() {});

                          }

                        },

                        style:
                            ElevatedButton.styleFrom(

                          backgroundColor:
                              Colors.white,

                          foregroundColor:
                              primaryGreen,

                          shape:
                              RoundedRectangleBorder(

                            borderRadius:
                                BorderRadius.circular(
                                    12),

                          ),

                        ),

                        child: Text(

                          currentUser
                                  .fullName
                                  .isEmpty
                              ? "Complete Health Profile"
                              : "Edit Health Profile",

                          style:
                              const TextStyle(

                            fontWeight:
                                FontWeight.bold,

                          ),
                        ),
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

                      icon: Icons
                          .document_scanner_outlined,

                      title:
                          "Total Scans",

                      value:
                          ScanHistoryService
                              .totalScans()
                              .toString(),

                      color:
                          Colors.blue,

                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(

                    child: _buildStatCard(

                      icon: Icons
                          .verified_outlined,

                      title:
                          "Healthy",

                      value:
                          ScanHistoryService
                              .healthyProducts()
                              .toString(),

                      color:
                          Colors.green,

                    ),
                  ),

                ],
              ),

              const SizedBox(height: 15),

              Row(

                children: [

                  Expanded(

                    child: _buildStatCard(

                      icon: Icons
                          .warning_amber_rounded,

                      title:
                          "Avoid",

                      value:
                          ScanHistoryService
                              .avoidProducts()
                              .toString(),

                      color:
                          Colors.orange,

                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(

                    child: _buildStatCard(

                      icon: Icons.history,

                      title:
                          "History",

                      value:
                          ScanHistoryService
                              .totalScans()
                              .toString(),

                      color:
                          Colors.purple,

                    ),
                  ),

                ],
              ),

              const SizedBox(height: 35),

              const Text(

                "Quick Actions",

                style: TextStyle(

                  fontSize: 22,

                  fontWeight:
                      FontWeight.bold,

                ),
              ),

              const SizedBox(height: 20),

              SizedBox(

                width: double.infinity,

                height: 60,

                child:
                    ElevatedButton.icon(

                  onPressed:
                      () async {

                    await Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder:
                            (_) =>
                                const ScannerScreen(),

                      ),

                    );

                    if (mounted) {

                      setState(() {});

                    }

                  },

                  icon: const Icon(
                      Icons.camera_alt),

                  label: const Text(

                    "Scan Food Label",

                    style: TextStyle(

                      fontSize: 18,

                    ),
                  ),

                  style:
                      ElevatedButton.styleFrom(

                    backgroundColor:
                        primaryGreen,

                    foregroundColor:
                        Colors.white,

                    shape:
                        RoundedRectangleBorder(

                      borderRadius:
                          BorderRadius.circular(
                              16),

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
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.history),
                  ),
                  title: const Text(
                    "View Scan History",
                  ),
                  subtitle: Text(
                    ScanHistoryService.totalScans() == 0
                        ? "No scans yet."
                        : "${ScanHistoryService.totalScans()} scan(s) available.",
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const HistoryScreen(),
                      ),
                    );

                    if (mounted) {
                      setState(() {});
                    }
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