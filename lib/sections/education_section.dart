import 'dart:ui';

import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../widgets/section_title.dart';
import '../widgets/responsive_widget.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Education',
            subtitle: 'Where I’ve studied and what I’ve achieved',
          ),
          const SizedBox(height: 24),
          Column(
            children: const [
              EducationItem(
                institute: 'Jain (Deemed-to-be) University',
                duration: '2020 – 2024',
                qualification: 'B.Tech in Computer Science',
                grade: 'CGPA: 9.073',
                notes:
                'Focused on full-stack and mobile development. Specialized in Flutter, Firebase, and software design principles.',
              ),
              SizedBox(height: 20),
              EducationItem(
                institute: 'Sri Chaitanya Mahila Jr Kalasala',
                duration: '2018 – 2020',
                qualification: 'Intermediate (MPC)',
                grade: 'CGPA: 10.0',
                notes:
                'Excelled in Mathematics, Physics, and Chemistry. Participated in technical events and Olympiads.',
              ),
              SizedBox(height: 20),
              EducationItem(
                institute: 'Kennedy EM High School',
                duration: '2017 – 2018',
                qualification: 'SSC',
                grade: 'CGPA: 9.7',
                notes:
                'Built strong fundamentals and discipline. Represented school in science fairs and coding competitions.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EducationItem extends StatelessWidget {
  final String institute;
  final String duration;
  final String qualification;
  final String grade;
  final String notes;

  const EducationItem({
    super.key,
    required this.institute,
    required this.duration,
    required this.qualification,
    required this.grade,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);

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
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildContent(),
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildContent(),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            duration,
            style: AppTextStyles.body.copyWith(
              color: AppColors.mutedText,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
            ),
        ),
    );
  }

  List<Widget> _buildContent() => [
    Text(
      institute,
      style: AppTextStyles.sectionTitle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    ),
    const SizedBox(height: 4),
    Text(
      qualification,
      style: AppTextStyles.body.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
      ),
    ),
    const SizedBox(height: 2),
    Text(
      grade,
      style: AppTextStyles.body.copyWith(
        color: AppColors.accent,
        fontWeight: FontWeight.w600,
      ),
    ),
    const SizedBox(height: 8),
    Text(
      notes,
      style: AppTextStyles.body.copyWith(color: AppColors.mutedText),
    ),
  ];
}
