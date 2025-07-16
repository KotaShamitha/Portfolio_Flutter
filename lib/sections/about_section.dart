import 'dart:ui';

import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../widgets/responsive_widget.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            title: 'About Me',
            subtitle: 'Who I am and what I do',
            align: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMobile)
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: Container(
                        height: 270, // Matches card + padding
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/profile.jpeg'),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(173, 216, 230, 0.5), // Pale blue glow
                              blurRadius: 24,
                              spreadRadius: 2,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(173, 216, 230, 0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromRGBO(173, 216, 230, 0.35),
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.1),
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'I am a highly motivated and results-driven software engineer specializing in frontend development. With strong experience in Flutter, Kotlin, and modern web technologies, I build responsive, user-friendly applications that scale across platforms.',
                          style: AppTextStyles.body,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'I’ve developed cross-platform mobile apps and collaborated with teams using Agile methodologies, delivering production-quality software. My goal is to create elegant, performant interfaces that users love.',
                          style: AppTextStyles.body,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Outside of work, I enjoy solving coding challenges and constantly learning through real-world projects and certifications.',
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
