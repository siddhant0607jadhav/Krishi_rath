import 'package:flutter/material.dart';
import 'package:krishi_rath/common/constants/app_colors.dart';
import 'package:krishi_rath/services/localization_service.dart';

class PriorityTag extends StatelessWidget {
  final String priority; // Expects "High", "Medium", or "Low"

  const PriorityTag({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    final tr = localizationService.translate;
    Color backgroundColor;
    Color textColor;
    String text;

    // Determine the color and translation key based on the priority
    switch (priority) {
      case 'High':
        backgroundColor = AppColors.highPriorityRed;
        textColor = AppColors.highPriorityRedText;
        text = tr('priority_high');
        break;
      case 'Medium':
        backgroundColor = AppColors.mediumPriorityYellow;
        textColor = AppColors.mediumPriorityYellowText;
        text = tr('priority_medium');
        break;
      case 'Low':
        backgroundColor = AppColors.lowPriorityBlue;
        textColor = AppColors.lowPriorityBlueText;
        text = tr('priority_low');
        break;
      default:
        backgroundColor = Colors.grey[200]!;
        textColor = Colors.grey[800]!;
        text = priority; // Fallback
    }

    return Chip(
      label: Text(text),
      backgroundColor: backgroundColor,
      labelStyle: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      visualDensity: VisualDensity.compact,
      side: BorderSide.none,
    );
  }
}

