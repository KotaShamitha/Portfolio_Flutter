import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'widgets/header.dart';
import 'sections/home_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/experience_section.dart';
import 'sections/education_section.dart';
import 'sections/certifications_section.dart';
import 'sections/contact_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kota Shamitha Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // we'll replace with pastel gradient
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final sectionKeys = {
    'Home': GlobalKey(),
    'About': GlobalKey(),
    'Skills': GlobalKey(),
    'Projects': GlobalKey(),
    'Experience': GlobalKey(),
    'Education': GlobalKey(),
    'Certifications': GlobalKey(),
    'Contact': GlobalKey(),
  };

  void scrollTo(String section) {
    final keyContext = sectionKeys[section]?.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ic_splash_background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Header(onNavItemTap: scrollTo),
              _buildSection(sectionKeys['Home']!, const HomeSection()),
              _buildSection(sectionKeys['About']!, const AboutSection()),
              _buildSection(sectionKeys['Skills']!, const SkillsSection()),
              _buildSection(sectionKeys['Projects']!, const ProjectsSection()),
              _buildSection(sectionKeys['Experience']!, const ExperienceSection()),
              _buildSection(sectionKeys['Education']!, const EducationSection()),
              _buildSection(sectionKeys['Certifications']!, const CertificationsSection()),
              _buildSection(sectionKeys['Contact']!, const ContactSection()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(GlobalKey key, Widget section) => Container(
    key: key,
    child: section,
  );
}
