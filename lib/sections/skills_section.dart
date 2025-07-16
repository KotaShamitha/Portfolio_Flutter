import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../config/app_theme.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<SkillCategory> skills = const [
    SkillCategory(
      title: 'Languages',
      items: ['HTML', 'CSS', 'Dart', 'Kotlin', 'JavaScript', 'C', 'Java',],
    ),
    SkillCategory(
      title: 'Frameworks',
      items: ['Flutter', 'Android-Kotlin',],
    ),
    SkillCategory(
      title: 'Tools',
      items: ['Git', 'GitLab', 'Firebase', 'Figma', 'Visual Studio Code', 'Android Studio', 'Postman', 'Google Collab', 'MS Word', 'MS Excel'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

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
            title: 'Skills',
            subtitle: 'Technologies I use to build amazing apps',
            align: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: 32),
          Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: skills
                  .map(
                    (category) => _SkillCard(
                  category: category,
                  isMobile: isMobile,
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillCategory {
  final String title;
  final List<String> items;

  const SkillCategory({
    required this.title,
    required this.items,
  });
}

class _SkillCard extends StatefulWidget {
  final SkillCategory category;
  final bool isMobile;

  const _SkillCard({required this.category, required this.isMobile});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final cardWidth = widget.isMobile ? double.infinity : 320.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Animate(
        effects: const [FadeEffect(), SlideEffect(begin: Offset(0, 0.1))],
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 200),
          offset: _hovering ? const Offset(0, -0.03) : Offset.zero,
    child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
    child: Container(
    width: cardWidth,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: const Color.fromRGBO(173, 216, 230, 0.12), // Pale blue with transparency
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
    color: const Color.fromRGBO(173, 216, 230, 0.35), // Subtle border
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
                  widget.category.title,
                  style: AppTextStyles.sectionTitle.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.category.items.map((skill) {
                    return Chip(
                      label: Text(skill),
                      labelStyle: const TextStyle(
                        fontSize: 13,
                        color: AppColors.primary,
                      ),
                      backgroundColor:
                      AppColors.lightAccent.withAlpha((0.3 * 255).round()),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: AppColors.accent.withAlpha(77),
                          width: 0.8.toDouble(),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        )
      ),
            ),
      ),
    );
  }
}
