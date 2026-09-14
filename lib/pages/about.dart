import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/icons.dart';
import '../components/layout.dart';
import '../components/seo.dart';
import '../components/ui.dart';
import '../data/site.dart';

class AboutPage extends StatelessComponent {
  const AboutPage({super.key});

  static const _story = [
    (
      title: 'Flutter and Dart, in depth',
      body:
          'My work is centred on Flutter and Dart — building scalable, high-performance mobile applications with '
          'clean architecture and codebases that stay maintainable as they grow.',
    ),
    (
      title: 'Below the widget layer',
      body:
          'Much of it happens underneath the UI: integrating third-party SDKs, building combined Flutter/native '
          'SDKs through platform channels, and working with FFI, BLE and Bluetooth Classic, audio streaming and '
          'processing, image processing, TensorFlow Lite, payment gateways and Google APIs.',
    ),
    (
      title: 'Building for the ecosystem',
      body:
          'I publish open-source Flutter packages — from a WebRTC client for real-time AI avatars to lint rules, '
          'animation and carousel widgets, and visual bug-reporting tools.',
    ),
    (
      title: 'Software meets hardware',
      body:
          'My background crosses into applied technology: a tubeless digital stethoscope, IoT smart-farming '
          'systems, published research, and earlier computer-vision work.',
    ),
  ];

  @override
  Component build(BuildContext context) {
    return SiteShell(
      path: '/about/',
      children: [
        Seo(
          path: '/about/',
          title: 'About',
          description:
              'About Jemis Goti, a Mumbai-based Flutter and Dart engineer working on native SDK integration, FFI, '
              'Bluetooth, audio, WebRTC, IoT and open-source developer tooling.',
          structuredData: [
            {
              '@context': 'https://schema.org',
              '@type': 'ProfilePage',
              'url': '${Site.url}/about/',
              'mainEntity': {'@id': '${Site.url}/#person'},
            },
          ],
        ),
        section(classes: 'page-hero', attributes: {'aria-labelledby': 'page-title'}, [
          div(classes: 'container', [
            p(classes: 'eyebrow', [.text('About')]),
            h1(id: 'page-title', classes: 'page-hero__title', [
              .text('Focused on the '),
              el('em', [.text('hard parts')]),
              .text(' of mobile development.'),
            ]),
            p(classes: 'page-hero__lead', [
              .text(
                "I'm Jemis Goti, a software engineer based in Mumbai specialising in Dart and Flutter. "
                'I write about Flutter, mobile engineering, app distribution and evolving platform requirements.',
              ),
            ]),
          ]),
        ]),
        section(classes: 'section section--flush', attributes: {'aria-labelledby': 'story-title'}, [
          div(classes: 'container', [
            h2(id: 'story-title', classes: 'visually-hidden', [.text('Story')]),
            el('ol', classes: 'story', attributes: {'role': 'list'}, [
              for (final (i, item) in _story.indexed)
                li(classes: 'story__item', attributes: {'data-reveal': ''}, [
                  span(classes: 'story__index', [.text((i + 1).toString().padLeft(2, '0'))]),
                  h3(classes: 'story__title', [.text(item.title)]),
                  p(classes: 'story__body', [.text(item.body)]),
                ]),
            ]),
          ]),
        ]),
        section(classes: 'section section--tinted', attributes: {'aria-labelledby': 'expertise-title'}, [
          div(classes: 'container', [
            SectionHead(
              id: 'expertise-title',
              index: '02',
              eyebrow: 'Expertise',
              title: [
                .text('Grouped by capability, '),
                el('em', [.text('not by logo.')]),
              ],
            ),
            el('dl', classes: 'expertise', [
              for (final cap in capabilities)
                div(classes: 'expertise__row', attributes: {'data-reveal': ''}, [
                  el('dt', [
                    span(classes: 'expertise__title', [.text(cap.title)]),
                    span(classes: 'expertise__summary', [.text(cap.summary)]),
                  ]),
                  el('dd', [tagList(cap.items)]),
                ]),
            ]),
          ]),
        ]),
        section(classes: 'section', attributes: {'aria-labelledby': 'background-title'}, [
          div(classes: 'container', [
            SectionHead(
              id: 'background-title',
              index: '03',
              eyebrow: 'Background',
              title: [
                .text('Education, learning '),
                el('em', [.text('and community.')]),
              ],
            ),
            div(classes: 'background-grid', [
              div(classes: 'card', attributes: {'data-reveal': ''}, [
                h3(classes: 'card__label', [.text('Education')]),
                p(classes: 'background__primary', [.text(Education.school)]),
                p(classes: 'muted mono', [.text(Education.period)]),
              ]),
              div(classes: 'card', attributes: {'data-reveal': ''}, [
                h3(classes: 'card__label', [.text('Community')]),
                p([
                  .text('I answer Flutter, Dart, Riverpod and deep-linking questions on Stack Overflow.'),
                ]),
                div(classes: 'link-row', [
                  extLink(Site.stackOverflow, classes: 'text-link', [
                    icon('stackoverflow'),
                    .text('Stack Overflow'),
                    icon('arrow-up-right'),
                  ]),
                ]),
              ]),
              div(classes: 'card card--wide', attributes: {'data-reveal': ''}, [
                h3(classes: 'card__label', [.text('Courses & certifications')]),
                ul(classes: 'cert-list', attributes: {'role': 'list'}, [
                  for (final c in certifications)
                    li([
                      span(classes: 'cert-list__title', [.text(c.title)]),
                      span(classes: 'cert-list__meta', [
                        .text(c.date == null ? c.issuer : '${c.issuer} · ${c.date}'),
                      ]),
                    ]),
                ]),
              ]),
            ]),
          ]),
        ]),
      ],
    );
  }
}
