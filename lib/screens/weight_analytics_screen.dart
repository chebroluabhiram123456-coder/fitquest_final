import 'package:flutter/material.dart';
import '../widgets/frosted_glass_card.dart';

class WeightAnalyticsScreen extends StatelessWidget {
  const WeightAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Weight Analytics'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrostedGlassCard(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Center(
                  child: Text(
                    'Log more than one weight entry\nto see your chart!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'History',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: Center(
                child: Text(
                  'No weight logged yet.',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
