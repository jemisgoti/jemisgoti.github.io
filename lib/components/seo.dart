import 'dart:convert';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/site.dart';

/// Per-page metadata: title, description, canonical URL, Open Graph, Twitter and JSON-LD.
class Seo extends StatelessComponent {
  const Seo({
    required this.path,
    this.title,
    this.description = Site.defaultDescription,
    this.structuredData = const [],
    this.noIndex = false,
    super.key,
  });

  final String path;

  /// Page title without the site suffix. `null` uses [Site.defaultTitle].
  final String? title;
  final String description;
  final List<Map<String, Object?>> structuredData;
  final bool noIndex;

  @override
  Component build(BuildContext context) {
    final fullTitle = title == null ? Site.defaultTitle : '$title — ${Site.name}';
    final url = path == '/' ? '${Site.url}/' : '${Site.url}$path';

    return Document.head(
      title: fullTitle,
      meta: {
        'description': description,
        'robots': ?(noIndex ? 'noindex, follow' : null),
        'twitter:card': 'summary',
        'twitter:title': fullTitle,
        'twitter:description': description,
      },
      children: [
        link(rel: 'canonical', href: url),
        _property('og:type', path == '/' ? 'profile' : 'website'),
        _property('og:site_name', Site.name),
        _property('og:locale', 'en_IN'),
        _property('og:title', fullTitle),
        _property('og:description', description),
        _property('og:url', url),
        if (path == '/') ...[
          _property('profile:first_name', 'Jemis'),
          _property('profile:last_name', 'Goti'),
        ],
        for (final data in [_breadcrumbs(url), ...structuredData].nonNulls)
          script(
            attributes: {'type': 'application/ld+json'},
            content: jsonEncode(data).replaceAll('</', r'<\/'),
          ),
      ],
    );
  }

  Component _property(String property, String content) =>
      meta(content: content, attributes: {'property': property});

  Map<String, Object?>? _breadcrumbs(String url) {
    if (path == '/' || noIndex) return null;
    return {
      '@context': 'https://schema.org',
      '@type': 'BreadcrumbList',
      'itemListElement': [
        {'@type': 'ListItem', 'position': 1, 'name': 'Home', 'item': '${Site.url}/'},
        {'@type': 'ListItem', 'position': 2, 'name': title, 'item': url},
      ],
    };
  }
}

/// schema.org Person describing Jemis, linked to public profiles.
Map<String, Object?> personSchema() => {
  '@context': 'https://schema.org',
  '@type': 'Person',
  '@id': '${Site.url}/#person',
  'name': Site.name,
  'url': '${Site.url}/',
  'jobTitle': 'Flutter Engineer',
  'email': 'mailto:${Site.email}',
  'description': Site.defaultDescription,
  'address': {
    '@type': 'PostalAddress',
    'addressLocality': 'Mumbai',
    'addressRegion': 'Maharashtra',
    'addressCountry': 'IN',
  },
  'alumniOf': {'@type': 'CollegeOrUniversity', 'name': Education.school},
  'knowsAbout': knowsAbout,
  'sameAs': [for (final p in profiles) p.url],
};

Map<String, Object?> websiteSchema() => {
  '@context': 'https://schema.org',
  '@type': 'WebSite',
  '@id': '${Site.url}/#website',
  'name': Site.name,
  'url': '${Site.url}/',
  'description': Site.defaultDescription,
  'inLanguage': 'en',
  'author': {'@id': '${Site.url}/#person'},
};
