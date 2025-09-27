import 'package:flutter/material.dart';
import 'package:krishi_rath/common/widgets/bilingual_text.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BilingualText(
                englishText: 'Nashik, Maharashtra',
                hindiText: 'नाशिक, महाराष्ट्र'),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.cloud_queue, size: 48, color: Colors.blue),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '28 °C',
                      style:
                      TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text('Partly Cloudy'),
                  ],
                ),
                const Spacer(),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Icon(Icons.water_drop, size: 16),
                      SizedBox(width: 4),
                      Text('65%')
                    ]),
                    SizedBox(height: 8),
                    Row(children: [
                      Icon(Icons.air, size: 16),
                      SizedBox(width: 4),
                      Text('12 km/h')
                    ]),
                    SizedBox(height: 8),
                    Row(children: [
                      Icon(Icons.cloud, size: 16),
                      SizedBox(width: 4),
                      Text('30%')
                    ]),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const Text(
              'Last updated: 2 hours ago • अंतिम अपडेट: 2 hours ago',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

