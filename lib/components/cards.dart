import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/site.dart';
import 'icons.dart';
import 'ui.dart';

class PackageCard extends StatelessComponent {
  const PackageCard(this.package, {this.detailed = false, super.key});

  final Package package;

  /// Shows highlights, install command and badges (Open Source page).
  final bool detailed;

  @override
  Component build(BuildContext context) {
    final pkg = package;
    return el(
      'article',
      classes: 'card package-card${pkg.featured ? ' package-card--featured' : ''}',
      attributes: {'id': pkg.name, 'data-reveal': ''},
      [
        div(classes: 'package-card__top', [
          span(classes: 'package-card__category', [.text(pkg.category)]),
          if (pkg.note != null) span(classes: 'status', [.text(pkg.note!)]),
        ]),
        h3(classes: 'package-card__name', [
          extLink(pkg.pubUrl, classes: 'stretched', [.text(pkg.name)]),
        ]),
        p(classes: 'package-card__tagline', [.text(pkg.tagline)]),
        if (detailed) p(classes: 'package-card__desc', [.text(pkg.description)]),
        if (detailed && pkg.highlights.isNotEmpty)
          ul(classes: 'checklist', attributes: {'role': 'list'}, [
            for (final h in pkg.highlights) li([.text(h)]),
          ]),
        if (detailed && pkg.install != null) installCommand(pkg.install!),
        div(classes: 'package-card__footer', [
          tagList(pkg.tech),
          if (detailed) pubBadges(pkg.name),
          div(classes: 'link-row', [
            extLink(pkg.pubUrl, classes: 'text-link', [.text('pub.dev'), icon('arrow-up-right')]),
            if (detailed) extLink(pkg.docsUrl, classes: 'text-link', [.text('Docs'), icon('arrow-up-right')]),
            if (pkg.repo != null) extLink(pkg.repo!, classes: 'text-link', [.text('Source'), icon('arrow-up-right')]),
            if (detailed && pkg.demo != null)
              extLink(pkg.demo!, classes: 'text-link', [.text('Live demo'), icon('arrow-up-right')]),
          ]),
        ]),
      ],
    );
  }
}

class ProjectCard extends StatelessComponent {
  const ProjectCard(this.project, {required this.index, this.detailed = false, super.key});

  final Project project;
  final int index;
  final bool detailed;

  @override
  Component build(BuildContext context) {
    final pr = project;
    return el('article', classes: 'project', attributes: {'id': pr.slug, 'data-reveal': ''}, [
      div(classes: 'project__index', attributes: {'aria-hidden': 'true'}, [
        .text(index.toString().padLeft(2, '0')),
      ]),
      div(classes: 'project__body', [
        div(classes: 'project__meta', [
          span([.text(pr.category)]),
          if (pr.period != null) span([.text(pr.period!)]),
          if (pr.status != null) span(classes: 'status', [.text(pr.status!)]),
        ]),
        h3(classes: 'project__title', [.text(pr.title)]),
        p(classes: 'project__summary', [.text(pr.summary)]),
        if (detailed && pr.details.isNotEmpty)
          ul(classes: 'checklist', attributes: {'role': 'list'}, [
            for (final d in pr.details) li([.text(d)]),
          ]),
        tagList(pr.tech),
      ]),
      if (pr.links.isNotEmpty)
        div(classes: 'project__links', [
          for (final link in pr.links)
            extLink(link.url, classes: 'text-link', label: '${pr.title} on ${link.label}', [
              .text(link.label),
              icon('arrow-up-right'),
            ]),
        ]),
    ]);
  }
}

class ArticleRow extends StatelessComponent {
  const ArticleRow(this.article, {super.key});

  final Article article;

  @override
  Component build(BuildContext context) {
    final ar = article;
    return el('article', classes: 'article-row', attributes: {'data-reveal': ''}, [
      div(classes: 'article-row__meta', [
        if (ar.date != null)
          el('time', [.text(formatDate(ar.date!))], attributes: {'datetime': isoDate(ar.date!)})
        else
          span([.text('Undated')]),
        span(classes: 'article-row__platform', [.text(ar.platform)]),
      ]),
      div(classes: 'article-row__main', [
        span(classes: 'article-row__category', [.text(ar.category)]),
        h3(classes: 'article-row__title', [
          extLink(ar.url, classes: 'stretched', [.text(ar.title)]),
        ]),
        tagList(ar.topics, classes: 'tags tags--quiet'),
      ]),
      span(classes: 'article-row__arrow', [icon('arrow-up-right')]),
    ]);
  }
}

class ResearchFeature extends StatelessComponent {
  const ResearchFeature({super.key});

  @override
  Component build(BuildContext context) {
    return el('article', classes: 'research card', attributes: {'data-reveal': ''}, [
      div(classes: 'research__head', [
        p(classes: 'research__venue', [
          .text('${Research.venue} · ${Research.issue} · ${Research.year}'),
        ]),
        h3(classes: 'research__title', [.text(Research.title)]),
        p(classes: 'research__summary', [.text(Research.summary)]),
      ]),
      el('ol', classes: 'pipeline', attributes: {'aria-label': 'System pipeline'}, [
        for (final step in Research.pipeline) li([.text(step)]),
      ]),
      el('dl', classes: 'research__specs', [
        div([
          el('dt', [.text('Hardware')]),
          el('dd', [tagList(Research.hardware)]),
        ]),
        div([
          el('dt', [.text('Software')]),
          el('dd', [tagList(Research.software)]),
        ]),
      ]),
    ]);
  }
}
