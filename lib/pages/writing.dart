import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/cards.dart';
import '../components/icons.dart';
import '../components/layout.dart';
import '../components/seo.dart';
import '../components/ui.dart';
import '../data/site.dart';

class WritingPage extends StatelessComponent {
  const WritingPage({super.key});

  @override
  Component build(BuildContext context) {
    return SiteShell(
      path: '/writing/',
      children: [
        Seo(
          path: '/writing/',
          title: 'Writing on Flutter & Mobile Engineering',
          description:
              'Technical articles by Jemis Goti on Flutter releases, Firebase Dynamic Links migration, deep linking '
              'and Google Play distribution requirements.',
          structuredData: [
            {
              '@context': 'https://schema.org',
              '@type': 'ItemList',
              'name': 'Articles by ${Site.name}',
              'itemListElement': [
                for (final (i, ar) in articles.indexed)
                  {
                    '@type': 'ListItem',
                    'position': i + 1,
                    'item': {
                      '@type': 'Article',
                      'headline': ar.title,
                      'url': ar.url,
                      'datePublished': ?(ar.date == null ? null : isoDate(ar.date!)),
                      'author': {'@type': 'Person', 'name': Site.name, 'url': '${Site.url}/'},
                      'publisher': {'@type': 'Organization', 'name': ar.platform},
                    },
                  },
              ],
            },
          ],
        ),
        section(classes: 'page-hero', attributes: {'aria-labelledby': 'page-title'}, [
          div(classes: 'container', [
            p(classes: 'eyebrow', [.text('Writing')]),
            h1(id: 'page-title', classes: 'page-hero__title', [
              .text('Notes from '),
              el('em', [.text('building with Flutter.')]),
            ]),
            p(classes: 'page-hero__lead', [
              .text(
                'Flutter, mobile engineering and developer infrastructure: release deep dives, platform deprecations '
                'and the app-store requirements that change how apps ship.',
              ),
            ]),
            div(classes: 'hero__actions', [
              extLink(Site.medium, classes: 'btn btn--primary', [icon('medium'), .text('Medium')]),
              extLink(Site.linkedin, classes: 'btn btn--ghost', [icon('linkedin'), .text('LinkedIn')]),
            ]),
          ]),
        ]),
        section(classes: 'section section--flush', attributes: {'aria-labelledby': 'articles-title'}, [
          div(classes: 'container', [
            h2(id: 'articles-title', classes: 'visually-hidden', [.text('Articles')]),
            div(classes: 'article-list article-list--page', [
              for (final article in articles) ArticleRow(article),
            ]),
          ]),
        ]),
      ],
    );
  }
}
