import 'package:flutter/material.dart';
import 'package:krishi_rath/common/widgets/bilingual_text.dart';
import 'package:krishi_rath/common/widgets/listen_button.dart';
import 'package:krishi_rath/services/localization_service.dart';

class MarketPriceCard extends StatelessWidget {
  final String cropName;
  final String hindiCropName;
  final String price;
  final double percentageChange;
  final String marketInfo;
  final IconData cropIcon;

  const MarketPriceCard({
    super.key,
    required this.cropName,
    required this.hindiCropName,
    required this.price,
    required this.percentageChange,
    required this.marketInfo,
    required this.cropIcon,
  });

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;
    final isPositive = percentageChange >= 0;
    final changeColor = isPositive ? Colors.green : Colors.red;
    // Construct the full string to be spoken
    final textToSpeak =
        '$cropName at Rupees $price ${tr('market_prices_per_quintal')}';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(cropIcon, color: Colors.black54),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BilingualText(
                    englishText: cropName,
                    hindiText: hindiCropName,
                    englishStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        isPositive
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        color: changeColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${percentageChange.abs()}% ${tr('market_prices_vs_yesterday')}',
                        style: TextStyle(
                            color: changeColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    marketInfo,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₹$price',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  tr('market_prices_per_quintal'),
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                ListenButton(textToSpeak: textToSpeak),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

