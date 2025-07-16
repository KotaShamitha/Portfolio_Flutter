import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../config/app_theme.dart';
import '../widgets/section_title.dart';
import '../widgets/responsive_widget.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFEBF3FA), // Soft powder blue
            Color(0xFFE4E4FC), // Very light lavender
            Color(0xFFF9F9FF), // Misty white
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            title: 'Experience',
            subtitle: 'Where I’ve worked and what I’ve done',
            align: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: 24),
          _buildExperienceCard(isMobile).animate().fadeIn(duration: 400.ms),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(bool isMobile) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
    child: Container(
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.only(top: 12),
    decoration: BoxDecoration(
    color: const Color.fromRGBO(173, 216, 230, 0.12), // Pale blue with transparency
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
    color: const Color.fromRGBO(173, 216, 230, 0.35),
    width: 1.2,
    ),
    boxShadow: [
    BoxShadow(
    color: Colors.blue.withOpacity(0.1),
    blurRadius: 18,
    offset: const Offset(0, 6),
    ),
    ],
    ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Associate Software Engineer',
            style: AppTextStyles.sectionTitle.copyWith(
              fontSize: isMobile ? 24 : 28,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Osmosys Software Solutions Pvt Ltd • Nov 2024 – May 2025',
            style: AppTextStyles.body.copyWith(
              color: AppColors.mutedText,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              BulletPoint(text: 'Focused on frontend and cross-platform mobile app development using Flutter and Kotlin.'),
              BulletPoint(text: 'Collaborated with agile teams to build scalable UI and integrate REST APIs.'),
              BulletPoint(text: 'Integrated Stripe, Firebase, and Agora SDKs across multiple apps.'),
              BulletPoint(text: 'Interacted with clients to understand project goals and offer technical insights.'),
              BulletPoint(text: 'Adapted quickly to best practices, delivering high-quality apps under tight timelines.'),
            ],
          ),
        ],
      ),
    ),
        ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: AppColors.accent)),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
