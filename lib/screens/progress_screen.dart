import 'package:flutter/material.dart';
import '../widgets/frosted_glass_card.dart';
import 'package:table_calendar/table_calendar.dart';
import 'weight_analytics_screen.dart';


class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Your Progress'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weight Analytics',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            FrostedGlassCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeightAnalyticsScreen()),
                );
              },
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    'Log more to see your chart!\n(Tap here for details)',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Today's Stats: Chest & Biceps",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const FrostedGlassCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('0 / 1', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('Exercises Done', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('0%', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('Completion', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Workout Streak',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            FrostedGlassCard(
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime.now(),
                calendarFormat: CalendarFormat.month,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
                  leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                  rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                ),
                calendarStyle: const CalendarStyle(
                  defaultTextStyle: TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(color: Colors.white70),
                  outsideTextStyle: TextStyle(color: Colors.white30),
                  todayDecoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
