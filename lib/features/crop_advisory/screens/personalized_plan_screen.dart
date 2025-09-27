import 'package:flutter/material.dart';
import 'package:krishi_rath/common/widgets/bilingual_text.dart';

class PersonalizedPlanScreen extends StatelessWidget {
  const PersonalizedPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // This AppBar will automatically use the green theme color
        title: const BilingualText(
          englishText: 'Your Personalized Plan',
          hindiText: 'आपकी व्यक्तिगत योजना',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSummaryCard(context),
          const SizedBox(height: 16),
          _buildPlanStepCard(
            context,
            step: 1,
            title: 'Land Preparation',
            hindiTitle: 'भूमि की तैयारी',
            icon: Icons.landscape,
            color: Colors.brown,
            tasks: [
              'Plow the field 2-3 times to get a fine tilth.',
              'Apply 10-15 tons of farmyard manure per acre.',
            ],
          ),
          _buildPlanStepCard(
            context,
            step: 2,
            title: 'Sowing & Planting',
            hindiTitle: 'बुवाई और रोपण',
            icon: Icons.grass,
            color: Colors.green,
            tasks: [
              'Use certified seeds for best results.',
              'Maintain a row-to-row spacing of 30 cm.',
            ],
          ),
          _buildPlanStepCard(
            context,
            step: 3,
            title: 'Fertilization Schedule',
            hindiTitle: 'उर्वरक अनुसूची',
            icon: Icons.science_outlined,
            color: Colors.blue,
            tasks: [
              'Apply first dose of NPK fertilizer after 25 days.',
              'Second dose should be applied at the flowering stage.',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BilingualText(
              englishText: 'Recommendation Summary',
              hindiText: 'सिफारिश सारांश',
              englishStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 20),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(text: 'Based on your input of '),
                  TextSpan(
                      text: 'Loamy Soil',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' and '),
                  TextSpan(
                      text: 'Drip Irrigation',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ', the recommended crop is '),
                  TextSpan(
                      text: 'Wheat',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '.'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPlanStepCard(
      BuildContext context, {
        required int step,
        required String title,
        required String hindiTitle,
        required IconData icon,
        required Color color,
        required List<String> tasks,
      }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(icon, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Step $step',
                        style: TextStyle(color: Colors.grey.shade600)),
                    BilingualText(
                      englishText: title,
                      hindiText: hindiTitle,
                      englishStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 24),
            ...tasks.map((task) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle_outline,
                      color: Theme.of(context).primaryColor, size: 20),
                  const SizedBox(width: 8),
                  Expanded(child: Text(task)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

