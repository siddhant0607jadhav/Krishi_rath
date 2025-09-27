import 'package:flutter/material.dart';
import 'package:krishi_rath/common/widgets/listen_button.dart';
import 'package:krishi_rath/common/widgets/priority_tag.dart';
import 'package:krishi_rath/services/localization_service.dart';

class UpdateCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String titleKey;
  final String descriptionKey;
  final String priority;

  const UpdateCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.titleKey,
    required this.descriptionKey,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;
    // Construct the full sentence to be spoken from the translated parts
    final textToSpeak = '${tr(titleKey)}. ${tr(descriptionKey)}';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          tr(titleKey),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      PriorityTag(priority: priority),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(tr(descriptionKey)),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    // Pass the fully translated string to the listen button
                    child: ListenButton(textToSpeak: textToSpeak),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

