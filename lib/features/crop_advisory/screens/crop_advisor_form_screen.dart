import 'package:flutter/material.dart';
import 'package:krishi_rath/common/widgets/bilingual_text.dart';
import 'package:krishi_rath/features/crop_advisory/screens/personalized_plan_screen.dart';
import 'package:krishi_rath/services/localization_service.dart';

class CropAdvisorFormScreen extends StatefulWidget {
  const CropAdvisorFormScreen({super.key});

  @override
  State<CropAdvisorFormScreen> createState() => _CropAdvisorFormScreenState();
}

class _CropAdvisorFormScreenState extends State<CropAdvisorFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _areaController = TextEditingController();
  final _soilTypeController = TextEditingController();
  String? _selectedIrrigation;
  bool _isRecommendationGenerated = false;

  // Get translation function
  String _tr(String key) => localizationService.translate(key);

  // Validation methods
  String? _validateArea(String? value) {
    if (value == null || value.isEmpty) {
      return _tr('validation_land_area_required');
    }
    final number = double.tryParse(value);
    if (number == null) {
      return _tr('validation_land_area_number');
    }
    if (number <= 0) {
      return _tr('validation_land_area_positive');
    }
    return null;
  }

  String? _validateSoilType(String? value) {
    if (value == null || value.isEmpty) {
      return _tr('validation_soil_type_required');
    }
    if (value.length < 2) {
      return _tr('validation_soil_type_valid');
    }
    return null;
  }

  String? _validateIrrigation(String? value) {
    if (value == null || value.isEmpty) {
      return _tr('validation_irrigation_required');
    }
    return null;
  }

  void _getRecommendation() {
    if (_formKey.currentState!.validate()) {
      // Hide keyboard
      FocusScope.of(context).unfocus();

      setState(() {
        _isRecommendationGenerated = true;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_tr('recommendation_success')),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _navigateToPlan() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PersonalizedPlanScreen(
            landArea: _areaController.text,
            soilType: _soilTypeController.text,
            irrigationType: _selectedIrrigation ?? _tr('not_selected'),
          ),
        ),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _areaController.clear();
    _soilTypeController.clear();
    _selectedIrrigation = null;
    setState(() {
      _isRecommendationGenerated = false;
    });
  }

  @override
  void dispose() {
    _areaController.dispose();
    _soilTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tr('crop_advisor_form_title')),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetForm,
            tooltip: _tr('reset_form_tooltip'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _tr('crop_advisor_form_land_details'),
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: _tr('crop_advisor_form_land_area'),
                hint: _tr('crop_advisor_form_hint_area'),
                controller: _areaController,
                validator: _validateArea,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: _tr('crop_advisor_form_soil_type'),
                hint: _tr('crop_advisor_form_hint_soil'),
                controller: _soilTypeController,
                validator: _validateSoilType,
              ),
              const SizedBox(height: 20),
              _buildDropdownField(
                label: _tr('crop_advisor_form_irrigation_type'),
                hint: _tr('crop_advisor_form_hint_irrigation'),
                value: _selectedIrrigation,
                validator: _validateIrrigation,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedIrrigation = newValue;
                  });
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _getRecommendation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: Text(
                  _tr('crop_advisor_form_get_recommendation'),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),

              // Reset button
              if (_isRecommendationGenerated)
                OutlinedButton(
                  onPressed: _resetForm,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(_tr('reset_form_button')),
                ),

              const SizedBox(height: 16),

              // Get Plan button - only appears after recommendation
              if (_isRecommendationGenerated)
                ElevatedButton(
                  onPressed: _navigateToPlan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: Text(
                    _tr('crop_advisor_form_get_plan'),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),

              // Form data preview (for debugging/confirmation)
              if (_isRecommendationGenerated) ...[
                const SizedBox(height: 24),
                Card(
                  color: Colors.grey[50],
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _tr('form_summary'),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('${_tr('crop_advisor_form_land_area')}: ${_areaController.text} ${_tr('acres_unit')}'),
                        Text('${_tr('crop_advisor_form_soil_type')}: ${_soilTypeController.text}'),
                        Text('${_tr('crop_advisor_form_irrigation_type')}: ${_selectedIrrigation ?? _tr('not_selected')}'),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          keyboardType: keyboardType,
          textInputAction: TextInputAction.next,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String hint,
    required String? value,
    required String? Function(String?) validator,
    required Function(String?) onChanged,
  }) {
    // Get translated irrigation methods
    final irrigationMethods = [
      _tr('irrigation_drip'),
      _tr('irrigation_sprinkler'),
      _tr('irrigation_canal'),
      'Flood Irrigation',
      'Rainfed'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          hint: Text(hint),
          items: irrigationMethods.map((String method) {
            return DropdownMenuItem<String>(
              value: method,
              child: Text(method),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}