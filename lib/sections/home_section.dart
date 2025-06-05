import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../widgets/social_links.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/ic_splash_background1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, I'm Kota Shamitha 👋",
                style: AppTextStyles.headline.copyWith(
                  fontSize: isMobile ? 28 : 38,
                ),
              )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: 0.3),
              const SizedBox(height: 16),
              Text(
                "Frontend Engineer | Flutter Developer",
                style: AppTextStyles.sectionTitle.copyWith(
                  fontSize: isMobile ? 18 : 24,
                  color: AppColors.accent,
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: 0.2),
              const SizedBox(height: 24),
              Text(
                "I specialize in building responsive mobile and web apps with Flutter, Kotlin, TypeScript, and Firebase. Let’s collaborate and create something impactful.",
                style: AppTextStyles.body.copyWith(
                  fontSize: isMobile ? 14 : 16,
                  color: AppColors.mutedText,
                ),
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
              )
                  .animate()
                  .fadeIn(duration: 700.ms)
                  .slideY(begin: 0.1),
              const SizedBox(height: 32),
              const SocialLinks()
                  .animate()
                  .fadeIn(duration: 800.ms)
                  .slideY(begin: 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
