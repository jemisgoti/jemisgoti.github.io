import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

final List<SocialMedia> socialMediaLinks = [
  SocialMedia(
      icon: FontAwesomeIcons.linkedin,
      url: 'https://www.linkedin.com/in/jemis-goti/'),
  SocialMedia(
      icon: FontAwesomeIcons.github, url: 'https://github.com/jemisgoti'),
  SocialMedia(
      icon: FontAwesomeIcons.twitter, url: 'https://twitter.com/jemisgoti'),
  SocialMedia(
      icon: FontAwesomeIcons.facebook,
      url: 'https://www.linkedin.com/in/jemisgoti09'),
  SocialMedia(
      icon: FontAwesomeIcons.instagram,
      url: 'https://www.instagram.com/jemisgoti/'),
  SocialMedia(
      icon: FontAwesomeIcons.medium, url: 'https://medium.com/@jemisgoti'),
];

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 48, top: 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                runSpacing: 24,
                spacing: 24,
                children: socialMediaLinks
                    .map(
                      (e) => buildIcon(e),
                    )
                    .toList()),
          ),
          const Gap(24),
          Text(
            'Copyright ${DateTime.now().year} All rights reserved :: WASM :$kIsWasm',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIcon(SocialMedia info) {
    return InkWell(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(info.url))) {
          launchUrl(Uri.parse(info.url));
        }
      },
      mouseCursor: SystemMouseCursors.click,
      child: Icon(
        info.icon,
        size: 36,
      ),
    );
  }
}

class SocialMedia {
  final IconData icon;
  final String url;

  SocialMedia({
    required this.icon,
    required this.url,
  });
}
