import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextAlign align;
  final CrossAxisAlignment crossAxisAlignment;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.align = TextAlign.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          textAlign: align,
          style: AppTextStyles.sectionTitle.copyWith(
            fontSize: MediaQuery.of(context).size.width < 800 ? 22 : 28,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            textAlign: align,
            style: AppTextStyles.body.copyWith(
              fontSize: MediaQuery.of(context).size.width < 800 ? 14 : 16,
            ),
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}
