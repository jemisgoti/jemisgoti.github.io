import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/cards.dart';
import '../components/layout.dart';
import '../components/seo.dart';
import '../components/ui.dart';
import '../data/site.dart';

class WorkPage extends StatelessComponent {
  const WorkPage({super.key});

  @override
  Component build(BuildContext context) {
    return SiteShell(
      path: '/work/',
      children: [
        const Seo(
          path: '/work/',
          title: 'Work & Research',
          description:
              'Flutter engineering by Jemis Goti across WebRTC and AI avatars, a digital stethoscope, IoT smart '
              'farming, developer tooling and computer vision — plus published IoT research.',
        ),
        section(classes: 'page-hero', attributes: {'aria-labelledby': 'page-title'}, [
          div(classes: 'container', [
            p(classes: 'eyebrow', [.text('Work')]),
            h1(id: 'page-title', classes: 'page-hero__title', [
              .text('Engineering at the edges of '),
              el('em', [.text('mobile.')]),
            ]),
            p(classes: 'page-hero__lead', [
              .text(
                'Projects where Flutter is only the starting point: real-time media, connected medical hardware, '
                'agricultural IoT, developer tooling and computer vision.',
              ),
            ]),
          ]),
        ]),
        section(classes: 'section section--flush', attributes: {'aria-labelledby': 'projects-title'}, [
          div(classes: 'container', [
            h2(id: 'projects-title', classes: 'visually-hidden', [.text('Projects')]),
            div(classes: 'project-list', [
              for (final (i, project) in projects.indexed) ProjectCard(project, index: i + 1, detailed: true),
            ]),
          ]),
        ]),
        section(classes: 'section section--tinted', attributes: {'aria-labelledby': 'beyond-title'}, [
          div(classes: 'container', [
            SectionHead(
              id: 'beyond-title',
              index: '02',
              eyebrow: 'Beyond projects',
              title: [
                .text('Production, enterprise '),
                el('em', [.text('and community.')]),
              ],
            ),
            ul(classes: 'engagement-grid', attributes: {'role': 'list'}, [
              for (final e in engagements)
                li(classes: 'card engagement', attributes: {'data-reveal': ''}, [
                  h3(classes: 'engagement__title', [.text(e.title)]),
                  p([.text(e.summary)]),
                ]),
            ]),
          ]),
        ]),
        section(classes: 'section', attributes: {'aria-labelledby': 'research-title'}, [
          div(classes: 'container', [
            SectionHead(
              id: 'research-title',
              index: '03',
              eyebrow: 'Research',
              title: [
                .text('Research & '),
                el('em', [.text('applied technology.')]),
              ],
              lead:
                  'Published work on bringing IoT sensors, a Flutter app, maps and machine learning together for agriculture.',
            ),
            const ResearchFeature(),
          ]),
        ]),
      ],
    );
  }
}
