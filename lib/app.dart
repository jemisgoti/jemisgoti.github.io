import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'pages/about.dart';
import 'pages/contact.dart';
import 'pages/home.dart';
import 'pages/not_found.dart';
import 'pages/open_source.dart';
import 'pages/work.dart';
import 'pages/writing.dart';

/// Root component. Every route is pre-rendered to its own HTML file at build time.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Router(
      routes: [
        Route(
          path: '/',
          builder: (context, state) => const HomePage(),
          settings: const RouteSettings(changeFreq: ChangeFreq.monthly, priority: 1.0),
        ),
        Route(
          path: '/open-source',
          builder: (context, state) => const OpenSourcePage(),
          settings: const RouteSettings(changeFreq: ChangeFreq.monthly, priority: 0.9),
        ),
        Route(
          path: '/work',
          builder: (context, state) => const WorkPage(),
          settings: const RouteSettings(changeFreq: ChangeFreq.monthly, priority: 0.9),
        ),
        Route(
          path: '/writing',
          builder: (context, state) => const WritingPage(),
          settings: const RouteSettings(changeFreq: ChangeFreq.monthly, priority: 0.7),
        ),
        Route(
          path: '/about',
          builder: (context, state) => const AboutPage(),
          settings: const RouteSettings(changeFreq: ChangeFreq.yearly, priority: 0.8),
        ),
        Route(
          path: '/contact',
          builder: (context, state) => const ContactPage(),
          settings: const RouteSettings(changeFreq: ChangeFreq.yearly, priority: 0.8),
        ),
        Route(path: '/404', builder: (context, state) => const NotFoundPage()),
      ],
    );
  }
}
