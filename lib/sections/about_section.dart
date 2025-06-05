import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../widgets/responsive_widget.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'About Me',
            subtitle: 'Who I am and what I do',
          ),
          ResponsiveWidget(
            mobile: _buildContent(isMobile: true),
            desktop: _buildContent(isMobile: false),
          ),
        ],
      ),
    );
  }

  Widget _buildContent({required bool isMobile}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMobile)
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Image.asset(
                'assets/images/profile.jpeg', // Optional profile image
                height: 220,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person, size: 100, color: Colors.grey);
                },
              ),
            ),
          ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                'I am a highly motivated and results-driven software engineer '
                    'specializing in frontend development. With strong experience in '
                    'Flutter, Kotlin, and modern web technologies, I build responsive, '
                    'user-friendly applications that scale across platforms.',
                style: AppTextStyles.body,
              ),
              SizedBox(height: 16),
              Text(
                'I’ve developed cross-platform mobile apps and collaborated with teams '
                    'using Agile methodologies, delivering production-quality software. '
                    'My goal is to create elegant, performant interfaces that users love.',
                style: AppTextStyles.body,
              ),
              SizedBox(height: 16),
              Text(
                'Outside of work, I enjoy solving coding challenges and constantly learning '
                    'through real-world projects and certifications.',
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
