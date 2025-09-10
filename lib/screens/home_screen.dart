import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';
import '../widgets/frosted_glass_card.dart';
import 'workout_details_screen.dart';
import 'weight_analytics_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get today's day name (e.g., "Monday")
    final today = DateFormat('EEEE').format(DateTime.now());
    
    // Listen to the provider for changes
    final workoutProvider = Provider.of<WorkoutProvider>(context);
    final todayPlan = workoutProvider.getPlanForDay(today) ?? WorkoutPlan(day: today, title: 'No Plan Today');

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDateSelector(),
              const SizedBox(height: 24),
              Text(
                'Get ready, User',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                "Here's your plan for $today", // Dynamic day
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 24),
              FrostedGlassCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WorkoutDetailsScreen()),
                  );
                },
                child: ListTile(
                  title: Text(todayPlan.title), // Dynamic title from provider
                  subtitle: Text('${todayPlan.exerciseCount} exercises'), // Dynamic count from provider
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              FrostedGlassCard(
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WeightAnalyticsScreen()),
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.monitor_weight_outlined, color: Colors.white),
                  title: Text('Weight for 10 Sep'),
                  subtitle: Text('No Entry'),
                  trailing: Icon(Icons.add, color: Colors.white),
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const FrostedGlassCard(
                child: ListTile(
                  leading: Icon(Icons.local_fire_department, color: Colors.orange),
                  title: Text('Day 0 / 5'),
                  subtitle: Text("Let's start the week strong!"),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    // ... (This widget remains unchanged)
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildDateChip('Mon', '8'),
          _buildDateChip('Tue', '9'),
          _buildDateChip('Wed', '10', isSelected: true),
          _buildDateChip('Thu', '11'),
          _buildDateChip('Fri', '12'),
          _buildDateChip('Sat', '13'),
        ],
      ),
    );
  }

  Widget _buildDateChip(String day, String date, {bool isSelected = false}) {
     // ... (This widget remains unchanged)
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
