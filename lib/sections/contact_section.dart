import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../config/app_theme.dart';
import '../widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      width: double.infinity,
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            title: 'Get in Touch',
            subtitle: 'Let’s build something amazing together ✨',
          ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2),
          const SizedBox(height: 32),

          // 💬 Contact Card
          Animate(
            effects: const [FadeEffect(), SlideEffect(begin: Offset(0, 0.1))],
            child: Container(
              width: isMobile ? double.infinity : 600,
              padding: const EdgeInsets.all(24),
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
                children: [
                  Text(
                    "Feel free to reach out via email or connect on LinkedIn/GitHub.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      fontSize: isMobile ? 14 : 16,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "I’m open to collaboration, internships, and freelance work.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      fontSize: isMobile ? 14 : 16,
                      color: AppColors.mutedText,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _ContactIcons()
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Footer
          Text(
            "© 2025 Kota Shamitha. All rights reserved.",
            style: AppTextStyles.body.copyWith(
              fontSize: 13,
              color: AppColors.mutedText,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 900.ms),
        ],
      ),
    );
  }
}

// 🔗 Icon Row with hover + click effect
class _ContactIcons extends StatelessWidget {
  final List<_ContactItem> links = const [
    _ContactItem(
      icon: Icons.email,
      tooltip: "Email",
      url: "mailto:kotashamitha@gmail.com",
    ),
    _ContactItem(
      icon: Icons.link,
      tooltip: "LinkedIn",
      url: "https://www.linkedin.com/in/kotashamitha/",
    ),
    _ContactItem(
      icon: Icons.code,
      tooltip: "GitHub",
      url: "https://github.com/kotashamitha",
    ),
  ];

  // const _ContactIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      children: links
          .map((link) => Tooltip(
        message: link.tooltip,
        child: InkWell(
          onTap: () async => await launchUrl(Uri.parse(link.url)),
          borderRadius: BorderRadius.circular(8),
          hoverColor: AppColors.accent.withAlpha(20),
          splashColor: AppColors.accent.withAlpha(30),
          child: Icon(
            link.icon,
            size: 28,
            color: AppColors.accent,
          ),
        ),
      ))
          .toList(),
    );
  }
}

class _ContactItem {
  final IconData icon;
  final String tooltip;
  final String url;

  const _ContactItem({
    required this.icon,
    required this.tooltip,
    required this.url,
  });
}
