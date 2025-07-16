import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;

import '../config/app_theme.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _sending = false;

  Future<void> _sendEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _sending = true);

    const formEndpoint = "https://formspree.io/f/mzzvbjbe"; // replace with your Formspree URL

    try {
      final response = await http.post(
        Uri.parse(formEndpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': _nameController.text,
          'email': _emailController.text,
          'message': _messageController.text,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent successfully!')),
        );
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFEBF3FA),
            Color(0xFFE4E4FC),
            Color(0xFFF9F9FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            title: 'Get in Touch',
            subtitle: 'Let’s build something amazing together ✨',
            align: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2),
          const SizedBox(height: 32),
          Animate(
            effects: const [FadeEffect(), SlideEffect(begin: Offset(0, 0.1))],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  width: isMobile ? double.infinity : 500,
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
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextField(_nameController, 'Name'),
                        const SizedBox(height: 12),
                        _buildTextField(_emailController, 'Email',
                            keyboardType: TextInputType.emailAddress),
                        const SizedBox(height: 12),
                        _buildTextField(_messageController, 'Message',
                            maxLines: 4),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _sending ? null : _sendEmail,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accent,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: _sending
                              ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                              : const Text('Send Message'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Divider(
            thickness: 0.4,
            color: Colors.black.withOpacity(0.1),
            indent: 40,
            endIndent: 40,
            height: 1,
          ),
          const SizedBox(height: 16),
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

  Widget _buildTextField(TextEditingController controller, String label,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: AppTextStyles.body,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter your $label';
        if (label == 'Email' && !value.contains('@')) return 'Enter a valid email';
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.body.copyWith(color: AppColors.mutedText),
        filled: true,
        fillColor: AppColors.lightAccent.withOpacity(0.05),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
          BorderSide(color: AppColors.accent.withOpacity(0.3), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
          BorderSide(color: AppColors.accent.withOpacity(0.7), width: 1.2),
        ),
      ),
    );
  }
}