import 'package:flutter/material.dart';
import '../widgets/frosted_glass_card.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Weekly Plan'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPlanCard('Monday', 'Chest & Biceps'),
          _buildPlanCard('Tuesday', 'Back & Triceps'),
          _buildPlanCard('Wednesday', 'Legs & Shoulders'),
          _buildPlanCard('Thursday', 'Rest'),
          _buildPlanCard('Friday', 'Chest & Back'),
          _buildPlanCard('Saturday', 'Rest'),
          _buildPlanCard('Sunday', 'Rest'),
        ],
      ),
    );
  }

  Widget _buildPlanCard(String day, String muscles) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: FrostedGlassCard(
        child: ListTile(
          title: Text(day, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          subtitle: Text(muscles, style: const TextStyle(color: Colors.white70)),
          trailing: const Icon(Icons.edit, color: Colors.white),
          onTap: () {},
        ),
      ),
    );
  }
}
