import 'package:flutter/material.dart';
import 'package:krishi_rath/common/widgets/bilingual_text.dart';
import 'package:krishi_rath/services/localization_service.dart';

class PersonalizedPlanScreen extends StatelessWidget {
  final String landArea;
  final String soilType;
  final String irrigationType;

  const PersonalizedPlanScreen({
    super.key,
    required this.landArea,
    required this.soilType,
    required this.irrigationType,
  });

  // Get translation function
  String _tr(String key) => localizationService.translate(key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tr('personalized_plan_title')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSummaryCard(context),
          const SizedBox(height: 16),
          _buildPlanStepCard(
            context,
            step: 1,
            title: _tr('personalized_plan_step1_title'),
            icon: Icons.landscape,
            color: Colors.brown,
            tasks: [
              _tr('plan_task_plow'),
              _tr('plan_task_manure'),
            ],
          ),
          _buildPlanStepCard(
            context,
            step: 2,
            title: _tr('personalized_plan_step2_title'),
            icon: Icons.grass,
            color: Colors.green,
            tasks: [
              _tr('plan_task_seeds'),
              _tr('plan_task_spacing'),
            ],
          ),
          _buildPlanStepCard(
            context,
            step: 3,
            title: _tr('personalized_plan_step3_title'),
            icon: Icons.science_outlined,
            color: Colors.blue,
            tasks: [
              _tr('plan_task_npk1'),
              _tr('plan_task_npk2'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    String recommendedCrop = _getRecommendedCrop(soilType);

    return Card(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _tr('personalized_plan_summary_title'),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 20),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(text: '${_tr('recommendation_based_on')} '),
                  TextSpan(
                    text: '$landArea ${_tr('acres_unit')}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' ${_tr('recommendation_land_area')} '),
                  TextSpan(
                    text: soilType,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' ${_tr('recommendation_soil')} '),
                  TextSpan(
                    text: irrigationType.toLowerCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' ${_tr('recommendation_irrigation')} '),
                  TextSpan(
                    text: recommendedCrop,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getRecommendedCrop(String soilType) {
    if (soilType.toLowerCase().contains('loamy') || soilType.toLowerCase().contains('दोमट') || soilType.toLowerCase().contains('चिकणमाती')) {
      return _tr('recommendation_crop_loamy');
    } else if (soilType.toLowerCase().contains('sandy') || soilType.toLowerCase().contains('रेतीली') || soilType.toLowerCase().contains('वालुकामय')) {
      return _tr('recommendation_crop_sandy');
    } else if (soilType.toLowerCase().contains('clay') || soilType.toLowerCase().contains('चिकनी') || soilType.toLowerCase().contains('चिकण')) {
      return _tr('recommendation_crop_clay');
    } else {
      return _tr('recommendation_crop_default');
    }
  }

  Widget _buildPlanStepCard(
      BuildContext context, {
        required int step,
        required String title,
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
                    Text(
                      '${_tr('Step')} $step',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
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