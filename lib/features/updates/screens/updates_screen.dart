import 'package:flutter/material.dart';
import 'package:krishi_rath/features/updates/widgets/update_card.dart';
import 'package:krishi_rath/services/localization_service.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;

    return DefaultTabController(
      length: 5, // The number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(tr('updates_title')),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: tr('updates_tab_all')),
              Tab(text: tr('updates_tab_alerts')),
              Tab(text: tr('updates_tab_tasks')),
              Tab(text: tr('updates_tab_market')),
              Tab(text: tr('updates_tab_weather')),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Example Update Cards using the widget from the Canvas
            const UpdateCard(
              icon: Icons.warning_amber_rounded,
              iconColor: Colors.red,
              titleKey: 'updates_pest_alert_title',
              descriptionKey: 'updates_pest_alert_desc',
              priority: 'High',
            ),
            const UpdateCard(
              icon: Icons.check_circle_outline,
              iconColor: Colors.orange,
              titleKey: 'updates_task_fertilizer_title',
              descriptionKey: 'updates_task_fertilizer_desc',
              priority: 'Medium',
            ),
            const UpdateCard(
              icon: Icons.trending_up,
              iconColor: Colors.green,
              titleKey: 'updates_market_price_title',
              descriptionKey: 'updates_market_price_desc',
              priority: 'Medium',
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(tr('updates_load_more')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

