import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/icons.dart';
import '../components/layout.dart';
import '../components/seo.dart';
import '../components/ui.dart';
import '../data/site.dart';

class ContactPage extends StatelessComponent {
  const ContactPage({super.key});

  @override
  Component build(BuildContext context) {
    return SiteShell(
      path: '/contact/',
      children: [
        Seo(
          path: '/contact/',
          title: 'Contact',
          description:
              'Contact Jemis Goti about Flutter apps, native SDK and Bluetooth integrations, real-time media, '
              'AI features or Flutter packages. Email ${Site.email}.',
          structuredData: [
            {
              '@context': 'https://schema.org',
              '@type': 'ContactPage',
              'url': '${Site.url}/contact/',
              'mainEntity': {'@id': '${Site.url}/#person'},
            },
          ],
        ),
        section(classes: 'page-hero', attributes: {'aria-labelledby': 'page-title'}, [
          div(classes: 'container', [
            p(classes: 'eyebrow', [.text('Contact')]),
            h1(id: 'page-title', classes: 'page-hero__title', [
              .text('Have a Flutter problem without a '),
              el('em', [.text('ready-made solution?')]),
            ]),
            p(classes: 'page-hero__lead', [
              .text(
                "Tell me what you're building — a new Flutter app, a native SDK or hardware integration, "
                "real-time media or a package — and where it's stuck.",
              ),
            ]),
          ]),
        ]),
        section(classes: 'section section--flush', attributes: {'aria-label': 'Ways to get in touch'}, [
          div(classes: 'container contact-grid', [
            div(classes: 'contact-card', attributes: {'data-reveal': ''}, [
              p(classes: 'contact-card__label', [.text('Email')]),
              a(href: Site.mailto, classes: 'contact-card__email', [.text(Site.email)]),
              p(classes: 'contact-card__note', [
                .text('Email works best. A few lines on the project, platforms and timeline is plenty to start.'),
              ]),
              div(classes: 'contact-card__actions', [
                a(href: Site.mailto, classes: 'btn btn--light', [icon('mail'), .text('Email me')]),
                copyButton(Site.email, label: 'Copy email', classes: 'btn btn--outline-light'),
              ]),
              div(classes: 'contact-card__elsewhere', [
                p(classes: 'contact-card__label', [.text('Elsewhere')]),
                div(classes: 'contact-card__links', [
                  extLink(Site.linkedin, classes: 'contact-link', [
                    icon('linkedin'),
                    .text('LinkedIn'),
                    icon('arrow-up-right'),
                  ]),
                  extLink(Site.github, classes: 'contact-link', [
                    icon('github'),
                    .text('GitHub'),
                    icon('arrow-up-right'),
                  ]),
                ]),
              ]),
            ]),
            div(classes: 'contact-info', [
              div(classes: 'card', attributes: {'data-reveal': ''}, [
                h2(classes: 'card__label', [.text('Good fits')]),
                ul(classes: 'checklist', attributes: {'role': 'list'}, [
                  for (final fit in contactFits) li([.text(fit)]),
                ]),
              ]),
              div(classes: 'card', attributes: {'data-reveal': ''}, [
                h2(classes: 'card__label', [.text('Helpful to include')]),
                el('ol', classes: 'numbered', attributes: {'role': 'list'}, [
                  for (final (i, item) in contactChecklist.indexed)
                    li([
                      span(classes: 'numbered__index', [.text((i + 1).toString().padLeft(2, '0'))]),
                      span([.text(item)]),
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
