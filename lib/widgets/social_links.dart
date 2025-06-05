import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  void _launch(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      children: [
        IconButton(
          icon: const Icon(Icons.email),
          onPressed: () => _launch("mailto:kotashamitha@gmail.com"),
        ),
        IconButton(
          icon: const Icon(Icons.link),
          onPressed: () => _launch("https://www.linkedin.com/in/kotashamitha/"),
        ),
        IconButton(
          icon: const Icon(Icons.code),
          onPressed: () => _launch("https://github.com/kotashamitha"),
        ),
      ],
    );
  }
}
