import 'package:flutter/material.dart';
import 'package:krishi_rath/features/diary/widgets/activity_log_item.dart';
import 'package:krishi_rath/features/diary/widgets/upcoming_task_item.dart';
import 'package:krishi_rath/services/localization_service.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('diary_title')),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildLogActivityCard(tr),
          const SizedBox(height: 24),
          _buildSectionHeader(tr('diary_upcoming_tasks'), Icons.notifications),
          const SizedBox(height: 8),
          UpcomingTaskItem(
            icon: Icons.grass,
            taskKey: 'diary_task_fertilizer',
            priority: 'High',
            dueDate: now.add(const Duration(days: 2)),
          ),
          UpcomingTaskItem(
            icon: Icons.bug_report,
            taskKey: 'diary_task_pests',
            priority: 'Medium',
            dueDate: now.add(const Duration(days: 5)),
          ),
          UpcomingTaskItem(
            icon: Icons.eco,
            taskKey: 'diary_task_harvest',
            priority: 'High',
            dueDate: now.add(const Duration(days: 10)),
          ),
          const SizedBox(height: 24),
          _buildSectionHeader(
              tr('diary_recent_activities'), Icons.history),
          const SizedBox(height: 8),
          ActivityLogItem(
            icon: Icons.water_drop,
            titleKey: 'diary_activity_watered_title',
            cropKey: 'diary_activity_watered_crop',
            descriptionKey: 'diary_activity_watered_desc',
            weatherKey: 'diary_activity_watered_weather',
            date: now.subtract(const Duration(days: 2)),
            hasVoiceNote: true,
          ),
          ActivityLogItem(
            icon: Icons.science,
            titleKey: 'diary_activity_applied_npk_title',
            cropKey: 'diary_activity_applied_npk_crop',
            descriptionKey: 'diary_activity_applied_npk_desc',
            weatherKey: 'diary_activity_applied_npk_weather',
            date: now.subtract(const Duration(days: 3)),
          ),
        ],
      ),
    );
  }

  Widget _buildLogActivityCard(String Function(String) tr) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              tr('diary_log_activity'),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '"I watered my wheat today" / "आज मैंने अपने गेहूं में पानी दिया"',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.mic),
              label: Text(tr('diary_voice_input')),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 44),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[700]),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

