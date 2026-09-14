import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/cards.dart';
import '../components/icons.dart';
import '../components/layout.dart';
import '../components/seo.dart';
import '../components/ui.dart';
import '../data/site.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return SiteShell(
      path: '/',
      children: [
        Seo(path: '/', structuredData: [personSchema(), websiteSchema()]),
        const _Hero(),
        const _Capabilities(),
        const _OpenSource(),
        const _SelectedWork(),
        const _WritingAndResearch(),
      ],
    );
  }
}

class _Hero extends StatelessComponent {
  const _Hero();

  static const _layers = [
    (depth: 'L0', name: 'Widget tree', detail: 'Flutter · Dart · architecture'),
    (depth: 'L1', name: 'Platform channels', detail: 'Android · iOS · native SDKs'),
    (depth: 'L2', name: 'FFI', detail: 'dart:ffi · low-level integrations'),
    (depth: 'L3', name: 'Devices & streams', detail: 'BLE · Bluetooth Classic · audio · WebRTC'),
    (depth: 'L4', name: 'Hardware & models', detail: 'IoT sensors · TensorFlow Lite · AI APIs'),
  ];

  @override
  Component build(BuildContext context) {
    return section(classes: 'hero', attributes: {'aria-labelledby': 'hero-title'}, [
      div(classes: 'container hero__grid', [
        div(classes: 'hero__copy', [
          p(classes: 'eyebrow hero__eyebrow', [
            span(classes: 'dot', attributes: {'aria-hidden': 'true'}, []),
            .text('Flutter & Dart engineer · ${Site.location}'),
          ]),
          h1(id: 'hero-title', classes: 'hero__title', [
            span(classes: 'visually-hidden', [.text('${Site.name} — ')]),
            .text('Flutter engineer building '),
            el('em', [.text('beyond the widget tree.')]),
          ]),
          p(classes: 'hero__lead', [
            .text(
              'I build production-grade Flutter applications, native integrations, SDKs and developer tools — '
              'with a focus on performance, maintainability and the hard parts of mobile engineering.',
            ),
          ]),
          div(classes: 'hero__actions', [
            a(href: '/work/', classes: 'btn btn--primary', [.text('View work'), icon('arrow-right')]),
            a(href: '/contact/', classes: 'btn btn--ghost', [icon('mail'), .text('Get in touch')]),
            a(href: '/open-source/', classes: 'btn btn--ghost', [icon('package'), .text('Open source')]),
          ]),
        ]),
        el(
          'figure',
          classes: 'stack',
          attributes: {'aria-labelledby': 'stack-caption'},
          [
            div(classes: 'stack__header', [
              span([.text('the stack I work across')]),
              span(classes: 'stack__hint', [.text('depth ↓')]),
            ]),
            el('ol', classes: 'stack__layers', attributes: {'role': 'list'}, [
              for (final layer in _layers)
                li(classes: 'stack__layer', [
                  span(classes: 'stack__depth', [.text(layer.depth)]),
                  span(classes: 'stack__name', [.text(layer.name)]),
                  span(classes: 'stack__detail', [.text(layer.detail)]),
                ]),
            ]),
            el('figcaption', classes: 'stack__caption', attributes: {'id': 'stack-caption'}, [
              .text("I like working on the parts of mobile development that don't have a ready-made solution."),
            ]),
          ],
        ),
      ]),
    ]);
  }
}

class _Capabilities extends StatelessComponent {
  const _Capabilities();

  @override
  Component build(BuildContext context) {
    return section(classes: 'section', attributes: {'aria-labelledby': 'capabilities-title'}, [
      div(classes: 'container', [
        SectionHead(
          id: 'capabilities-title',
          index: '01',
          eyebrow: 'Capabilities',
          title: [
            .text('Deep Flutter, and everything '),
            el('em', [.text('underneath it.')]),
          ],
          lead:
              'My work starts in Dart and regularly reaches into native SDKs, FFI, Bluetooth, audio, '
              'real-time communication and connected hardware.',
          action: (label: 'More about me', href: '/about/'),
        ),
        ul(classes: 'capability-grid', attributes: {'role': 'list'}, [
          for (final (i, cap) in capabilities.indexed)
            li(classes: 'capability', attributes: {'data-reveal': ''}, [
              span(classes: 'capability__index', [.text((i + 1).toString().padLeft(2, '0'))]),
              h3(classes: 'capability__title', [.text(cap.title)]),
              p(classes: 'capability__summary', [.text(cap.summary)]),
              tagList(cap.items, classes: 'tags tags--quiet'),
            ]),
        ]),
      ]),
    ]);
  }
}

class _OpenSource extends StatelessComponent {
  const _OpenSource();

  @override
  Component build(BuildContext context) {
    return section(classes: 'section section--tinted', attributes: {'aria-labelledby': 'oss-title'}, [
      div(classes: 'container', [
        SectionHead(
          id: 'oss-title',
          index: '02',
          eyebrow: 'Open source',
          title: [
            .text("I don't just use Flutter. "),
            el('em', [.text('I build for its ecosystem.')]),
          ],
          lead: 'Open-source Flutter packages and developer tools built to solve practical engineering problems.',
          action: (label: 'All packages', href: '/open-source/'),
        ),
        div(classes: 'package-grid', [
          for (final package in packages) PackageCard(package),
        ]),
      ]),
    ]);
  }
}

class _SelectedWork extends StatelessComponent {
  const _SelectedWork();

  @override
  Component build(BuildContext context) {
    return section(classes: 'section', attributes: {'aria-labelledby': 'work-title'}, [
      div(classes: 'container', [
        SectionHead(
          id: 'work-title',
          index: '03',
          eyebrow: 'Selected work',
          title: [
            .text('Where software meets '),
            el('em', [.text('hardware, media and models.')]),
          ],
          lead: 'Real-world engineering across real-time media, healthcare devices, IoT and computer vision.',
          action: (label: 'All work', href: '/work/'),
        ),
        div(classes: 'project-list', [
          for (final (i, project) in projects.take(4).indexed) ProjectCard(project, index: i + 1),
        ]),
      ]),
    ]);
  }
}

class _WritingAndResearch extends StatelessComponent {
  const _WritingAndResearch();

  @override
  Component build(BuildContext context) {
    return section(classes: 'section section--tinted', attributes: {'aria-labelledby': 'writing-title'}, [
      div(classes: 'container', [
        SectionHead(
          id: 'writing-title',
          index: '04',
          eyebrow: 'Writing & research',
          title: [
            .text('Notes from '),
            el('em', [.text('building with Flutter.')]),
          ],
          lead: 'Flutter releases, platform changes, app distribution and deep linking — plus published IoT research.',
          action: (label: 'All writing', href: '/writing/'),
        ),
        div(classes: 'split', [
          div(classes: 'article-list', [
            for (final article in articles.take(3)) ArticleRow(article),
          ]),
          const ResearchFeature(),
        ]),
      ]),
    ]);
  }
}
