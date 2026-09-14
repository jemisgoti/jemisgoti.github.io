/// The entrypoint for the **server** environment.
///
/// In static mode this runs at build time and pre-renders every route to HTML.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'data/site.dart';
import 'main.server.options.dart';

/// Applies the saved or system theme before first paint to avoid a flash.
const _themeBootstrap =
    "(function(){var d=document.documentElement;d.classList.add('js');"
    "try{var t=localStorage.getItem('theme');"
    "if(t!=='light'&&t!=='dark'){t=matchMedia('(prefers-color-scheme: dark)').matches?'dark':'light'}"
    "d.dataset.theme=t}catch(e){}})();";

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    Document(
      lang: 'en',
      meta: {
        'author': Site.name,
        'color-scheme': 'light dark',
        'theme-color': '#f4f3ee',
        'robots': 'index, follow, max-image-preview:large',
        'format-detection': 'telephone=no',
      },
      head: [
        link(rel: 'icon', href: '/favicon.svg', type: 'image/svg+xml'),
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(rel: 'preconnect', href: 'https://fonts.gstatic.com', attributes: {'crossorigin': ''}),
        link(
          rel: 'stylesheet',
          href:
              'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Instrument+Serif:ital@0;1&family=JetBrains+Mono:wght@400;500&display=swap',
        ),
        link(rel: 'stylesheet', href: '/styles.css'),
        script(content: _themeBootstrap),
        script(src: '/site.js', defer: true),
      ],
      body: const App(),
    ),
  );
}
