import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../config/app_theme.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<ProjectData> projects = const [
    ProjectData(
      title: 'Flutter-Firebase Chat App',
      description:
      'Real-time chat with Firebase backend, authentication, and push notifications. Responsive UI and cross-platform support.',
      technologies: ['Flutter', 'Firebase', 'Push Notifications'],
      link: 'https://github.com/your-repo/chat-app',
    ),
    ProjectData(
      title: 'Kotlin Expense Tracker',
      description:
      'Track expenses with real-time charts, budget goals, and local database. Built with Jetpack Compose and Room DB.',
      technologies: ['Kotlin', 'Jetpack Compose', 'Room DB'],
      link: 'https://github.com/your-repo/expense-tracker',
    ),
    ProjectData(
      title: 'Portfolio Website',
      description:
      'This website — built using Flutter Web with GitHub CI/CD and responsive animations.',
      technologies: ['Flutter Web', 'GitHub Actions', 'Responsive Design'],
      link: 'https://github.com/your-repo/portfolio',
    ),
  ];

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
            title: 'Projects',
            subtitle: 'What I’ve built and contributed to',
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 700;
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: projects.map((project) {
                  return _ProjectCard(project: project, isMobile: isMobile);
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProjectData {
  final String title;
  final String description;
  final List<String> technologies;
  final String link;

  const ProjectData({
    required this.title,
    required this.description,
    required this.technologies,
    required this.link,
  });
}

class _ProjectCard extends StatelessWidget {
  final ProjectData project;
  final bool isMobile;

  const _ProjectCard({required this.project, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final cardWidth = isMobile ? double.infinity : 360.0;

    return Animate(
      effects: const [FadeEffect(), SlideEffect(begin: Offset(0, 0.1))],
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
            color: Colors.blue.withOpacity(0.1), // light shadow
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: AppTextStyles.sectionTitle.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 12),
            Text(
              project.description,
              style: AppTextStyles.body,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.technologies
                  .map(
                    (tech) => Chip(
                  label: Text(tech),
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
                ),
              )
                  .toList(),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // TODO: open project.link in browser
              },
              child: const Text('View on GitHub →'),
            ),
          ],
        ),
      ),
    ),
        ),
    );
  }
}
