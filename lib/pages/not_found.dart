import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/icons.dart';
import '../components/layout.dart';
import '../components/seo.dart';
import '../components/ui.dart';

class NotFoundPage extends StatelessComponent {
  const NotFoundPage({super.key});

  @override
  Component build(BuildContext context) {
    return SiteShell(
      path: '/404/',
      children: [
        const Seo(path: '/404/', title: 'Page not found', noIndex: true),
        section(classes: 'page-hero page-hero--center', attributes: {'aria-labelledby': 'page-title'}, [
          div(classes: 'container', [
            p(classes: 'eyebrow', [.text('404')]),
            h1(id: 'page-title', classes: 'page-hero__title', [
              .text('This route '),
              el('em', [.text("isn't in the tree.")]),
            ]),
            p(classes: 'page-hero__lead', [.text('The page you were looking for does not exist or has moved.')]),
            div(classes: 'hero__actions', [
              a(href: '/', classes: 'btn btn--primary', [.text('Back home'), icon('arrow-right')]),
            ]),
          ]),
        ]),
      ],
    );
  }
}
