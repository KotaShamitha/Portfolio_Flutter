import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../config/app_theme.dart';
import '../widgets/section_title.dart';
import '../widgets/responsive_widget.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  final List<String> certifications = const [
    'CS50: Introduction to Computer Science – Harvard University',
    'Flutter & Dart - The Complete Guide – Academind',
    'Learn to Build Scalable Flutter Apps with BLoC – DMG Coding',
    'Flutter & Dart Essentials – Syed Tanvir Ahmad',
    'Android 14 & Kotlin Development Masterclass – Denis Panjuta',
    'MongoDB CRUD Operations Certification',
    'Prepare for Linux Foundation Certified SysAdmin (LFCS)',
    'GOLD Badge in C – HackerRank',
  ];

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Certifications',
            subtitle: 'Courses and achievements that shaped my skills',
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: certifications
                .map(
                  (cert) => _CertificationCard(
                title: cert,
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

class _CertificationCard extends StatefulWidget {
  final String title;
  final bool isMobile;

  const _CertificationCard({
    required this.title,
    required this.isMobile,
  });

  @override
  State<_CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<_CertificationCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Animate(
        effects: const [FadeEffect(), SlideEffect(begin: Offset(0, 0.1))],
        child: AnimatedSlide(
          offset: _hovering ? const Offset(0, -0.01) : Offset.zero,
          duration: const Duration(milliseconds: 200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                width: widget.isMobile ? double.infinity : 420,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(173, 216, 230, 0.12), // Pale blue
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
                child: Text(
                  widget.title,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: widget.isMobile ? 14 : 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
