import 'package:flutter/material.dart';

class BilingualText extends StatelessWidget {
  final String englishText;
  final String hindiText;
  final TextStyle? englishStyle;
  final TextStyle? hindiStyle;
  final CrossAxisAlignment alignment;

  const BilingualText({
    super.key,
    required this.englishText,
    required this.hindiText,
    this.englishStyle,
    this.hindiStyle,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          englishText,
          style: englishStyle ??
              Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          hindiText,
          style: hindiStyle ??
              Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}

