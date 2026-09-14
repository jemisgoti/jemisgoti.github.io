import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'icons.dart';

/// Renders an arbitrary element with an optional class, for tags without a dedicated helper.
Component el(String tag, List<Component> children, {String? classes, Map<String, String> attributes = const {}}) {
  return Component.element(
    tag: tag,
    attributes: {'class': ?classes, ...attributes},
    children: children,
  );
}

/// A link that opens an external site in a new tab.
Component extLink(String href, List<Component> children, {String? classes, String? label}) {
  return a(
    href: href,
    classes: classes,
    attributes: {'target': '_blank', 'rel': 'noopener noreferrer', 'aria-label': ?label},
    children,
  );
}

Component tagList(List<String> tags, {String classes = 'tags'}) {
  return ul(classes: classes, attributes: {'role': 'list'}, [
    for (final tag in tags) li(classes: 'tag', [.text(tag)]),
  ]);
}

/// Numbered section heading used across pages.
class SectionHead extends StatelessComponent {
  const SectionHead({
    required this.index,
    required this.eyebrow,
    required this.title,
    this.lead,
    this.action,
    this.id,
    super.key,
  });

  final String index;
  final String eyebrow;
  final List<Component> title;
  final String? lead;
  final ({String label, String href})? action;
  final String? id;

  @override
  Component build(BuildContext context) {
    return div(classes: 'section-head', [
      div(classes: 'section-head__meta', [
        span(classes: 'section-head__index', [.text(index)]),
        span(classes: 'section-head__eyebrow', [.text(eyebrow)]),
      ]),
      div(classes: 'section-head__main', [
        h2(id: id, classes: 'section-head__title', title),
        if (lead != null) p(classes: 'section-head__lead', [.text(lead!)]),
      ]),
      if (action case final action?)
        a(href: action.href, classes: 'text-link section-head__action', [
          .text(action.label),
          icon('arrow-right'),
        ]),
    ]);
  }
}

/// A copyable `flutter pub add` command.
Component installCommand(String command) {
  return div(classes: 'install', [
    el('code', [
      span(classes: 'install__prompt', attributes: {'aria-hidden': 'true'}, [.text(r'$ ')]),
      .text(command),
    ]),
    button(
      classes: 'install__copy',
      attributes: {'type': 'button', 'data-copy': command, 'aria-label': 'Copy install command'},
      [icon('copy'), span(classes: 'install__copied', [.text('Copied')])],
    ),
  ]);
}

/// A button that copies [value] to the clipboard and briefly confirms it (see web/site.js).
Component copyButton(String value, {required String label, String classes = 'btn btn--ghost'}) {
  return button(
    classes: '$classes copy-btn',
    attributes: {'type': 'button', 'data-copy': value},
    [
      icon('copy'),
      span(classes: 'copy-btn__label', [.text(label)]),
      span(classes: 'copy-btn__done', attributes: {'aria-live': 'polite'}, [.text('Copied')]),
    ],
  );
}

/// Live pub.dev badges. Metrics change constantly, so they are never hard-coded.
Component pubBadges(String package) {
  return div(classes: 'badges', [
    for (final kind in ['v', 'likes'])
      img(
        src: 'https://img.shields.io/pub/$kind/$package?style=flat-square&label=${kind == 'v' ? 'pub' : 'likes'}&labelColor=1f1f1c&color=3d6bff',
        alt: kind == 'v' ? 'Latest $package version on pub.dev' : '$package likes on pub.dev',
        attributes: {'loading': 'lazy', 'decoding': 'async', 'height': '20'},
      ),
  ]);
}

String formatDate(DateTime date) {
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return '${months[date.month - 1]} ${date.day}, ${date.year}';
}

String isoDate(DateTime date) =>
    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
