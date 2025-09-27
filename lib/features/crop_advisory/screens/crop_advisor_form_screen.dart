import 'package:flutter/material.dart';
import 'package:krishi_rath/features/crop_advisory/screens/personalized_plan_screen.dart';

class CropAdvisorFormScreen extends StatefulWidget {
  const CropAdvisorFormScreen({super.key});

  @override
  State<CropAdvisorFormScreen> createState() => _CropAdvisorFormScreenState();
}

class _CropAdvisorFormScreenState extends State<CropAdvisorFormScreen> {
  // State variable to control the visibility of the 'Get Plan' button
  bool _isRecommendationGenerated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Advisor'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Land Details',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Land Area (acres)',
              hint: 'e.g., 5.0',
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Land Soil Type',
              hint: 'e.g., Loamy, Sandy',
            ),
            const SizedBox(height: 20),
            _buildDropdownField(
              label: 'Irrigation Type',
              hint: 'Select an irrigation method',
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // When this button is pressed, we show the 'Get Plan' button
                setState(() {
                  _isRecommendationGenerated = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Get Recommendation',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),

            // This button only appears after 'Get Recommendation' is clicked
            if (_isRecommendationGenerated)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PersonalizedPlanScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Get Plan',
                    style: TextStyle(color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
          ),
          hint: Text(hint),
          items: <String>['Drip Irrigation', 'Sprinkler', 'Canal']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );
  }
}
