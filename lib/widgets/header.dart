import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config/app_theme.dart';
import '../utils/screen_helper.dart';

class Header extends StatelessWidget {
  final void Function(String section) onNavItemTap;

  const Header({
    super.key,
    required this.onNavItemTap,
  });

  final List<String> navItems = const [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Experience',
    'Education',
    'Certifications',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ScreenHelper.isMobile(context);

    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEBF3FA), // Soft powder blue
            Color(0xFFE4E4FC), // Very light lavender
            Color(0xFFF9F9FF), // Misty white
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: const Border(
          bottom: BorderSide(color: Color(0x22000000), width: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: isMobile ? _buildMobileNav() : _buildDesktopNav(),
    );
  }

  Widget _buildDesktopNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Shamitha',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        Row(
          children: navItems.map((item) {
            return _NavButton(
              label: item,
              onTap: () {
                HapticFeedback.selectionClick(); // vibration
                onNavItemTap(item);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildMobileNav() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shamitha',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: navItems.map((item) {
            return _NavButton(
              label: item,
              onTap: () {
                HapticFeedback.selectionClick();
                onNavItemTap(item);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _NavButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavButton({
    required this.label,
    required this.onTap,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _hovering = false;

  @override
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
          setState(() {
            _hovering = true; // brief visual feedback on click
          });
          Future.delayed(const Duration(milliseconds: 200), () {
            if (mounted) setState(() => _hovering = false);
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: _hovering
              ? (Matrix4.identity()..scale(1.05))
              : Matrix4.identity(),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _hovering ? Colors.white.withOpacity(0.2) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: _hovering
                ? Border.all(color: Colors.white.withOpacity(0.3), width: 1)
                : null,
            boxShadow: _hovering
                ? [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 3),
              ),
            ]
                : [],
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _hovering ? AppColors.accent : AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
