import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/cards.dart';
import '../components/icons.dart';
import '../components/layout.dart';
import '../components/seo.dart';
import '../components/ui.dart';
import '../data/site.dart';

class OpenSourcePage extends StatelessComponent {
  const OpenSourcePage({super.key});

  @override
  Component build(BuildContext context) {
    return SiteShell(
      path: '/open-source/',
      children: [
        Seo(
          path: '/open-source/',
          title: 'Open-Source Flutter Packages',
          description:
              'Open-source Flutter and Dart packages by Jemis Goti: simli_client (WebRTC AI avatars), '
              'visual_feedback, hyper_lint, simple_ripple_animation and slick_carousel.',
          structuredData: [
            {
              '@context': 'https://schema.org',
              '@type': 'ItemList',
              'name': 'Open-source Flutter packages by ${Site.name}',
              'itemListElement': [
                for (final (i, p) in packages.indexed)
                  {
                    '@type': 'ListItem',
                    'position': i + 1,
                    'item': {
                      '@type': 'SoftwareSourceCode',
                      'name': p.name,
                      'description': p.description,
                      'url': p.pubUrl,
                      'codeRepository': ?p.repo,
                      'programmingLanguage': 'Dart',
                    },
                  },
              ],
            },
          ],
        ),
        section(classes: 'page-hero', attributes: {'aria-labelledby': 'page-title'}, [
          div(classes: 'container', [
            p(classes: 'eyebrow', [.text('Open source')]),
            h1(id: 'page-title', classes: 'page-hero__title', [
              .text("I don't just use Flutter. "),
              el('em', [.text('I build for its ecosystem.')]),
            ]),
            p(classes: 'page-hero__lead', [
              .text(
                'Packages and developer tools published to pub.dev — from real-time WebRTC clients to lint rules '
                'and UI components. Versions and likes below are pulled live from pub.dev.',
              ),
            ]),
            div(classes: 'hero__actions', [
              extLink(Site.github, classes: 'btn btn--primary', [icon('github'), .text('GitHub profile')]),
            ]),
          ]),
        ]),
        section(classes: 'section section--flush', attributes: {'aria-label': 'Packages'}, [
          div(classes: 'container', [
            div(classes: 'package-grid package-grid--detailed', [
              for (final package in packages) PackageCard(package, detailed: true),
            ]),
          ]),
        ]),
      ],
    );
  }
}
