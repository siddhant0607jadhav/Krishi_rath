import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:krishi_rath/common/widgets/listen_button.dart';
import 'package:krishi_rath/common/widgets/priority_tag.dart';
import 'package:krishi_rath/services/localization_service.dart';

class UpcomingTaskItem extends StatelessWidget {
  final IconData icon;
  final String taskKey;
  final String priority;
  final DateTime dueDate; // New required parameter for the due date

  const UpcomingTaskItem({
    super.key,
    required this.icon,
    required this.taskKey,
    required this.priority,
    required this.dueDate, // Added to the constructor
  });

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;
    final taskText = tr(taskKey);

    return Card(
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(taskText),
        // We use a Column to display both the priority and the due date
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            PriorityTag(priority: priority),
            const SizedBox(height: 6),
            Text(
              'Due: ${DateFormat('d MMMM yyyy').format(dueDate)}', // Display formatted date
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
        trailing: ListenButton(textToSpeak: taskText),
        isThreeLine: true, // Allows more space for the subtitle
      ),
    );
  }
}

