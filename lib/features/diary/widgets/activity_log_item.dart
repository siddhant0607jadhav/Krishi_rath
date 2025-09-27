import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:krishi_rath/common/widgets/listen_button.dart';
import 'package:krishi_rath/services/localization_service.dart';

class ActivityLogItem extends StatelessWidget {
  final IconData icon;
  final String titleKey;
  final String cropKey;
  final String descriptionKey;
  final String weatherKey;
  final DateTime date;
  final bool hasVoiceNote;

  const ActivityLogItem({
    super.key,
    required this.icon,
    required this.titleKey,
    required this.cropKey,
    required this.descriptionKey,
    required this.weatherKey,
    required this.date,
    this.hasVoiceNote = false,
  });

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;
    final titleText = tr(titleKey);
    final descriptionText = tr(descriptionKey);

    // Combine all translatable text for the ListenButton
    final String textToSpeak =
        '$titleText. ${tr(cropKey)}. $descriptionText. ${tr(weatherKey)}';

    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: Colors.blue.shade700, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleText,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            tr(cropKey),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          if (hasVoiceNote) ...[
                            const SizedBox(width: 8),
                            Chip(
                              avatar: const Icon(Icons.mic, size: 14),
                              label: Text(tr('diary_voice_note_chip')),
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                            )
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  DateFormat('d MMM yyyy').format(date),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(descriptionText),
            const SizedBox(height: 8),
            Text(
              tr(weatherKey),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ListenButton(textToSpeak: textToSpeak)],
            ),
          ],
        ),
      ),
    );
  }
}

