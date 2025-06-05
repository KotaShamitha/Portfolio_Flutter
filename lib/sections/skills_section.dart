import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../config/app_theme.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<SkillCategory> skills = const [
    SkillCategory(
      title: 'Languages',
      items: ['Dart', 'Kotlin', 'JavaScript', 'TypeScript'],
    ),
    SkillCategory(
      title: 'Frameworks',
      items: ['Flutter', 'Jetpack Compose', 'Node.js'],
    ),
    SkillCategory(
      title: 'Tools',
      items: ['Git', 'Firebase', 'Figma', 'GitHub Actions'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      color: AppColors.background,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Skills',
            subtitle: 'Technologies I use to build amazing apps',
          ),
          const SizedBox(height: 32),
          Wrap(
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
          child: Container(
            width: cardWidth,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
              border: Border.all(color: Colors.black.withAlpha(13)),
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
    );
  }
}
