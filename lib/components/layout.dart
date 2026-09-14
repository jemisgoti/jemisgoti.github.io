import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/site.dart';
import 'icons.dart';
import 'ui.dart';

/// Page chrome shared by every route: skip link, header, main landmark and footer.
class SiteShell extends StatelessComponent {
  const SiteShell({required this.path, required this.children, super.key});

  final String path;
  final List<Component> children;

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      a(href: '#main', classes: 'skip-link', [.text('Skip to content')]),
      SiteHeader(path: path),
      el('main', children, attributes: {'id': 'main', 'tabindex': '-1'}),
      SiteFooter(showContact: path != '/contact/'),
    ]);
  }
}

class SiteHeader extends StatelessComponent {
  const SiteHeader({required this.path, super.key});

  final String path;

  @override
  Component build(BuildContext context) {
    return header(classes: 'site-header', [
      div(classes: 'container site-header__inner', [
        a(href: '/', classes: 'brand', attributes: {'aria-label': '${Site.name} — home'}, [
          span(classes: 'brand__mark', attributes: {'aria-hidden': 'true'}, [.text('jg')]),
          span(classes: 'brand__name', [.text(Site.name)]),
        ]),
        nav(classes: 'site-nav', id: 'site-nav', attributes: {'aria-label': 'Primary'}, [
          ul(attributes: {'role': 'list'}, [
            for (final item in navItems)
              li([
                a(
                  href: item.path,
                  classes: 'site-nav__link',
                  attributes: {'aria-current': ?(item.path == path ? 'page' : null)},
                  [.text(item.label)],
                ),
              ]),
          ]),
        ]),
        div(classes: 'site-header__actions', [
          a(
            href: '/contact/',
            classes: 'contact-btn',
            attributes: {'aria-current': ?(path == '/contact/' ? 'page' : null)},
            [.text('Contact'), icon('arrow-right')],
          ),
          button(
            classes: 'icon-btn',
            attributes: {'type': 'button', 'data-theme-toggle': '', 'aria-label': 'Switch colour theme'},
            [icon('sun', classes: 'icon icon--sun'), icon('moon', classes: 'icon icon--moon')],
          ),
          button(
            classes: 'icon-btn nav-toggle',
            attributes: {
              'type': 'button',
              'data-nav-toggle': '',
              'aria-controls': 'site-nav',
              'aria-expanded': 'false',
              'aria-label': 'Open menu',
            },
            [icon('menu', classes: 'icon icon--menu'), icon('close', classes: 'icon icon--close')],
          ),
        ]),
      ]),
    ]);
  }
}

class SiteFooter extends StatelessComponent {
  const SiteFooter({this.showContact = true, super.key});

  /// Hidden on the contact page, which already carries the same call to action.
  final bool showContact;

  @override
  Component build(BuildContext context) {
    return footer(classes: 'site-footer', [
      div(classes: 'container', [
        if (showContact)
          div(classes: 'footer-cta', attributes: {'id': 'contact'}, [
            p(classes: 'eyebrow', [.text('Contact')]),
            h2(classes: 'footer-cta__title', [
              .text('Have a hard Flutter problem? '),
              el('em', [.text("Let's talk.")]),
            ]),
            p(classes: 'footer-cta__lead', [
              .text(
                'A new app, a native SDK or Bluetooth integration, real-time media, or a package — '
                "send a short note about what you're building and where it's stuck.",
              ),
            ]),
            div(classes: 'footer-cta__actions', [
              a(href: Site.mailto, classes: 'btn btn--light', [icon('mail'), .text(Site.email)]),
              copyButton(Site.email, label: 'Copy email', classes: 'btn btn--outline-light'),
              extLink(Site.linkedin, classes: 'btn btn--outline-light', [icon('linkedin'), .text('LinkedIn')]),
            ]),
          ]),
        p(classes: 'footer-sub', [.text(showContact ? 'Or explore the work' : 'Explore the work')]),
        ul(classes: 'profile-grid', attributes: {'role': 'list'}, [
          for (final profile in profiles)
            li([
              extLink(profile.url, classes: 'profile-card', [
                icon(profile.icon, classes: 'icon profile-card__icon'),
                span(classes: 'profile-card__text', [
                  span(classes: 'profile-card__label', [.text(profile.label)]),
                  span(classes: 'profile-card__handle', [.text(profile.handle)]),
                ]),
                icon('arrow-up-right', classes: 'icon profile-card__arrow'),
              ]),
            ]),
        ]),
        div(classes: 'footer-bottom', [
          p([.text('© ${DateTime.now().year} ${Site.name} · ${Site.location}')]),
          nav(attributes: {'aria-label': 'Footer'}, [
            ul(attributes: {'role': 'list'}, [
              li([a(href: '/', [.text('Home')])]),
              for (final item in navItems) li([a(href: item.path, [.text(item.label)])]),
              li([a(href: '/contact/', [.text('Contact')])]),
            ]),
          ]),
          p(classes: 'footer-bottom__built', [
            .text('Built in Dart with '),
            extLink('https://jaspr.site', [.text('Jaspr')]),
          ]),
        ]),
      ]),
    ]);
  }
}
