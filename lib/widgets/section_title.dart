import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.sectionTitle.copyWith(
            fontSize: MediaQuery.of(context).size.width < 800 ? 22 : 28,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
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
