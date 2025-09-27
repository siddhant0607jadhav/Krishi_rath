import 'package:flutter/material.dart';
import 'package:krishi_rath/features/schemes/widgets/scheme_card.dart';
import 'package:krishi_rath/services/localization_service.dart';

class SchemesScreen extends StatelessWidget {
  const SchemesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('schemes_title')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            tr('schemes_subtitle'),
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          // In a real app, this data would come from an API
          const SchemeCard(
            titleKey: 'schemes_pm_kisan_title',
            descriptionKey: 'schemes_pm_kisan_desc',
            statusKey: 'schemes_status_active',
            amountKey: 'schemes_amount_per_year',
            deadline: '31 March 2025',
            helpline: '155261',
            tagKey: 'priority_high',
          ),
          const SchemeCard(
            titleKey: 'schemes_crop_insurance_title',
            descriptionKey: 'schemes_crop_insurance_desc',
            statusKey: 'schemes_status_open',
            amountKey: 'schemes_amount_upto',
            deadline: '15 January 2025',
            helpline: '14447',
            tagKey: 'priority_high',
          ),
        ],
      ),
    );
  }
}

