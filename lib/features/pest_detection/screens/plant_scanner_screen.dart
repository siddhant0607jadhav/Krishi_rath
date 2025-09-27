import 'package:flutter/material.dart';
import 'package:krishi_rath/services/localization_service.dart';

class PlantScannerScreen extends StatelessWidget {
  const PlantScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('pest_detection_title')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(tr('pest_detection_subtitle'),
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            _buildCameraViewfinder(context, tr),
            const SizedBox(height: 24),
            _buildInstructions(context, tr),
            const SizedBox(height: 32),
            _buildActionButtons(tr),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraViewfinder(
      BuildContext context, String Function(String) tr) {
    return Card(
      color: Colors.grey[800], // Dark background for the viewfinder
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 1.0, // Make it square
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // These tags are not typically translated
                  Chip(
                    label: Text('AI Ready'),
                    backgroundColor: Colors.green,
                    labelStyle: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Chip(
                    label: Text('HD Quality'),
                    backgroundColor: Colors.blue,
                    labelStyle: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.camera_alt_outlined,
                      size: 64, color: Colors.white.withOpacity(0.7)),
                  const SizedBox(height: 8),
                  Text(tr('pest_detection_viewfinder_title'),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    tr('pest_detection_viewfinder_subtitle'),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                ],
              ),
              const SizedBox(), // Spacer
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstructions(BuildContext context, String Function(String) tr) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr('pest_detection_instructions_title'),
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildInstructionPoint(tr('pest_detection_instruction_1')),
            _buildInstructionPoint(tr('pest_detection_instruction_2')),
            _buildInstructionPoint(tr('pest_detection_instruction_3')),
            _buildInstructionPoint(tr('pest_detection_instruction_4')),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 14)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildActionButtons(String Function(String) tr) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.camera_alt),
          label: Text(tr('pest_detection_capture_button')),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 12),
        const Text('Or'),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.upload_file),
          label: Text(tr('pest_detection_upload_button')),
        ),
      ],
    );
  }
}

