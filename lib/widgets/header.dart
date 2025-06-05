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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.9 * 255).round()),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withAlpha((0.9 * 255).round()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: const Border(
          bottom: BorderSide(color: Color(0x11000000)),
        ),
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
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _hovering ? AppColors.lightAccent.withAlpha(50) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _hovering ? AppColors.accent : AppColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
