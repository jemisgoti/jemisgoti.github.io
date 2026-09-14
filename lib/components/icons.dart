import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

const _stroke = {
  'arrow-right': '<path d="M5 12h14M13 6l6 6-6 6"/>',
  'arrow-up-right': '<path d="M7 17 17 7M8 7h9v9"/>',
  'copy': '<rect x="9" y="9" width="11" height="11" rx="2"/><path d="M5 15V6a2 2 0 0 1 2-2h8"/>',
  'menu': '<path d="M4 7h16M4 12h16M4 17h16"/>',
  'close': '<path d="M6 6l12 12M18 6 6 18"/>',
  'sun':
      '<circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.9 4.9l1.4 1.4M17.7 17.7l1.4 1.4M2 12h2M20 12h2M4.9 19.1l1.4-1.4M17.7 6.3l1.4-1.4"/>',
  'moon': '<path d="M20 14.5A8 8 0 0 1 9.5 4 8 8 0 1 0 20 14.5z"/>',
  'package': '<path d="m12 3 8 4.5v9L12 21l-8-4.5v-9L12 3z"/><path d="m4 7.5 8 4.5 8-4.5M12 12v9"/>',
  'mail': '<rect x="3" y="5" width="18" height="14" rx="2"/><path d="m4 7 8 6 8-6"/>',
  'book':'<path d="M4 5a2 2 0 0 1 2-2h13v16H6a2 2 0 0 0-2 2V5z"/><path d="M4 19a2 2 0 0 1 2-2h13"/>',
};

const _brand = {
  'github':
      'M12 .3a12 12 0 0 0-3.8 23.38c.6.12.83-.26.83-.57L9 21.07c-3.34.72-4.04-1.61-4.04-1.61-.55-1.39-1.34-1.76-1.34-1.76-1.08-.74.09-.73.09-.73 1.2.09 1.83 1.24 1.83 1.24 1.07 1.83 2.81 1.3 3.5 1 .1-.78.42-1.31.76-1.61-2.67-.3-5.47-1.33-5.47-5.93 0-1.31.47-2.38 1.24-3.22-.14-.3-.54-1.52.1-3.18 0 0 1-.32 3.3 1.23a11.5 11.5 0 0 1 6 0c2.28-1.55 3.29-1.23 3.29-1.23.64 1.66.24 2.88.12 3.18a4.65 4.65 0 0 1 1.23 3.22c0 4.61-2.8 5.63-5.48 5.92.42.36.81 1.1.81 2.22l-.01 3.29c0 .31.2.69.82.57A12 12 0 0 0 12 .3',
  'linkedin':
      'M20.45 20.45h-3.56v-5.57c0-1.33-.02-3.04-1.85-3.04-1.85 0-2.13 1.45-2.13 2.94v5.67H9.35V9h3.41v1.56h.05c.48-.9 1.64-1.85 3.37-1.85 3.6 0 4.27 2.37 4.27 5.46v6.28zM5.34 7.43a2.06 2.06 0 1 1 0-4.12 2.06 2.06 0 0 1 0 4.12zM7.12 20.45H3.56V9h3.56v11.45zM22.22 0H1.77C.79 0 0 .77 0 1.73v20.54C0 23.23.79 24 1.77 24h20.45c.98 0 1.78-.77 1.78-1.73V1.73C24 .77 23.2 0 22.22 0z',
  'medium':
      'M13.54 12a6.8 6.8 0 0 1-6.77 6.82A6.8 6.8 0 0 1 0 12a6.8 6.8 0 0 1 6.77-6.82A6.8 6.8 0 0 1 13.54 12zm7.42 0c0 3.54-1.51 6.42-3.38 6.42-1.87 0-3.39-2.88-3.39-6.42s1.52-6.42 3.39-6.42 3.38 2.88 3.38 6.42M24 12c0 3.17-.53 5.75-1.19 5.75-.66 0-1.19-2.58-1.19-5.75s.53-5.75 1.19-5.75C23.47 6.25 24 8.83 24 12z',
  'stackoverflow':
      'M15.73 0 14 1.28l6.39 8.59 1.72-1.28L15.73 0zm-3.94 3.42-1.37 1.64 8.22 6.85 1.37-1.64-8.22-6.85zM8.64 7.88l-.9 1.94 9.7 4.52.9-1.94-9.7-4.52zm-1.85 4.86-.44 2.1 10.47 2.2.44-2.1-10.47-2.2zM1.89 15.47V24h19.19v-8.53h-2.13v6.4H4.02v-6.4H1.89zm4.27 2.13v2.13h10.66V17.6H6.16z',
};

/// Inline SVG icon. Decorative by default; wrap in a labelled control when meaningful.
Component icon(String name, {String classes = 'icon'}) {
  final brand = _brand[name];
  if (brand != null) {
    return RawText(
      '<svg class="$classes" viewBox="0 0 24 24" width="18" height="18" aria-hidden="true" focusable="false">'
      '<path fill="currentColor" d="$brand"/></svg>',
    );
  }
  return RawText(
    '<svg class="$classes" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" '
    'stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">'
    '${_stroke[name] ?? ''}</svg>',
  );
}
