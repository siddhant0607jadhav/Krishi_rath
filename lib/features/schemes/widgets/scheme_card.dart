import 'package:flutter/material.dart';
import 'package:krishi_rath/common/widgets/listen_button.dart';
import 'package:krishi_rath/common/widgets/priority_tag.dart';
// This is the line that has been corrected
import 'package:krishi_rath/services/localization_service.dart';

class SchemeCard extends StatelessWidget {
  final String titleKey;
  final String descriptionKey;
  final String statusKey;
  final String amountKey;
  final String deadline;
  final String helpline;
  final String tagKey;

  const SchemeCard({
    super.key,
    required this.titleKey,
    required this.descriptionKey,
    required this.statusKey,
    required this.amountKey,
    required this.deadline,
    required this.helpline,
    required this.tagKey,
  });

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;

    // Translate all the text keys first
    final title = tr(titleKey);
    final description = tr(descriptionKey);
    final status = tr(statusKey);
    final amount = tr(amountKey);

    // Combine the title and description for the ListenButton
    final textToSpeak = '$title. $description';

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.monetization_on, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                PriorityTag(priority: tr(tagKey)),
              ],
            ),
            const SizedBox(height: 12),
            Text(description),
            const SizedBox(height: 16),
            Row(
              children: [
                Chip(
                  label: Text(status),
                  backgroundColor: Colors.green[100],
                  labelStyle: TextStyle(color: Colors.green[800]),
                ),
                const SizedBox(width: 12),
                Text(
                  amount,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                ListenButton(textToSpeak: textToSpeak),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${tr('schemes_deadline')}: $deadline',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  '${tr('schemes_helpline')}: $helpline',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

