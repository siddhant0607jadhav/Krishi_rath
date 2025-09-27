import 'package:flutter/material.dart';
import 'package:krishi_rath/features/market_prices/widgets/market_price_card.dart';
import 'package:krishi_rath/services/localization_service.dart';

class MarketPricesScreen extends StatelessWidget {
  const MarketPricesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('market_prices_title')),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Chip(
              label: Text(tr('market_prices_live')),
              backgroundColor: Colors.red,
              labelStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          // In a real app, this list would be generated from API data
          MarketPriceCard(
            cropName: 'Rice',
            hindiCropName: 'चावल',
            price: '2650',
            percentageChange: 2.7,
            marketInfo: 'Nashik APMC • 2 hours ago',
            cropIcon: Icons.grass,
          ),
          MarketPriceCard(
            cropName: 'Wheat',
            hindiCropName: 'गेहूं',
            price: '2150',
            percentageChange: -2.3,
            marketInfo: 'Delhi Mandi • 1 hour ago',
            cropIcon: Icons.grain,
          ),
          MarketPriceCard(
            cropName: 'Tomato',
            hindiCropName: 'टमाटर',
            price: '4500',
            percentageChange: 18.4,
            marketInfo: 'Pune Market • 30 min ago',
            cropIcon: Icons.local_florist,
          ),
        ],
      ),
    );
  }
}

