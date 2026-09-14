/// Source-of-truth content for the website.
///
/// Everything here is taken from the research brief or verified on pub.dev / GitHub
/// (September 2026). Do not add clients, metrics, dates or outcomes that are not
/// publicly verifiable. Package versions and likes are rendered through live
/// shields.io badges instead of being hard-coded.
library;

abstract final class Site {
  static const name = 'Jemis Goti';
  static const url = 'https://jemisgoti.github.io';
  static const tagline = 'Flutter engineer building beyond the widget tree.';
  static const defaultTitle = 'Jemis Goti — Flutter Engineer & Dart Developer';
  static const defaultDescription =
      'Jemis Goti is a Flutter and Dart engineer building production mobile applications, '
      'native SDK integrations, real-time experiences, and open-source Flutter packages.';
  static const location = 'Mumbai, India';

  static const github = 'https://github.com/jemisgoti';
  static const linkedin = 'https://www.linkedin.com/in/jemis-goti/';
  static const medium = 'https://medium.com/@jemisgoti';
  static const stackOverflow = 'https://stackoverflow.com/users/21120002/jemis-goti';

  static const email = 'jemis.dev@gmail.com';
  static const mailto = 'mailto:$email?subject=Project%20enquiry';
}

// ---------------------------------------------------------------------------
// Contact
// ---------------------------------------------------------------------------

const contactFits = [
  'Flutter apps for Android and iOS — architecture, performance and release',
  'Native SDK integration through platform channels and FFI',
  'BLE, Bluetooth Classic and connected-hardware apps',
  'Audio streaming, WebRTC and real-time video',
  'AI and TensorFlow Lite features in mobile apps',
  'Flutter packages, lint rules and developer tooling',
];

const contactChecklist = [
  'What you are building and who it is for',
  'Platforms involved — Android, iOS, web, desktop',
  'SDKs, hardware or services that need integrating',
  'Where the project is today and your timeline',
];

class NavItem {
  const NavItem(this.label, this.path);
  final String label;
  final String path;
}

const navItems = [
  NavItem('Open Source', '/open-source/'),
  NavItem('Work', '/work/'),
  NavItem('Writing', '/writing/'),
  NavItem('About', '/about/'),
];

class Profile {
  const Profile({required this.label, required this.handle, required this.url, required this.icon});
  final String label;
  final String handle;
  final String url;
  final String icon;
}

const profiles = [
  Profile(label: 'GitHub', handle: 'jemisgoti', url: Site.github, icon: 'github'),
  Profile(label: 'LinkedIn', handle: 'jemis-goti', url: Site.linkedin, icon: 'linkedin'),
  Profile(label: 'Medium', handle: '@jemisgoti', url: Site.medium, icon: 'medium'),
  Profile(label: 'Stack Overflow', handle: 'jemis-goti', url: Site.stackOverflow, icon: 'stackoverflow'),
];

class LinkRef {
  const LinkRef(this.label, this.url);
  final String label;
  final String url;
}

// ---------------------------------------------------------------------------
// Capabilities
// ---------------------------------------------------------------------------

class Capability {
  const Capability({required this.title, required this.summary, required this.items});
  final String title;
  final String summary;
  final List<String> items;
}

const capabilities = [
  Capability(
    title: 'Mobile engineering',
    summary: 'Production Flutter apps with maintainable, scalable architecture.',
    items: ['Flutter', 'Dart', 'Android', 'iOS', 'Clean Architecture'],
  ),
  Capability(
    title: 'Platform integration',
    summary: 'Reaching below the widget layer into native code and SDKs.',
    items: ['Platform Channels', 'Dart FFI', 'Native SDKs', 'BLE', 'Bluetooth Classic', 'MFi'],
  ),
  Capability(
    title: 'Real-time & media',
    summary: 'Streaming audio, video and data between devices and services.',
    items: ['WebRTC', 'Audio streaming', 'Audio processing', 'Video', 'WebSockets'],
  ),
  Capability(
    title: 'AI / ML',
    summary: 'On-device models and AI-powered features inside mobile apps.',
    items: ['TensorFlow Lite', 'Image processing', 'AI integrations'],
  ),
  Capability(
    title: 'Infrastructure',
    summary: 'The production plumbing around an app and its release.',
    items: ['Firebase', 'Google APIs', 'Payment gateways', 'Deep linking', 'App distribution'],
  ),
  Capability(
    title: 'Developer experience',
    summary: 'Tools and packages other Flutter developers can build on.',
    items: ['Dart packages', 'Linting', 'Developer tooling', 'Documentation'],
  ),
];

// ---------------------------------------------------------------------------
// Open source
// ---------------------------------------------------------------------------

class Package {
  const Package({
    required this.name,
    required this.tagline,
    required this.description,
    required this.category,
    required this.tech,
    this.highlights = const [],
    this.install,
    this.repo,
    this.demo,
    this.note,
    this.featured = false,
  });

  final String name;
  final String tagline;
  final String description;
  final String category;
  final List<String> tech;
  final List<String> highlights;
  final String? install;
  final String? repo;
  final String? demo;
  final String? note;
  final bool featured;

  String get pubUrl => 'https://pub.dev/packages/$name';
  String get docsUrl => 'https://pub.dev/documentation/$name/latest/';
}

const packages = [
  Package(
    name: 'simli_client',
    tagline: 'Real-time AI avatars in Flutter, over WebRTC.',
    description:
        'A Flutter client for the Simli API that integrates live, low-latency AI avatars and '
        'conversational video experiences into Flutter applications.',
    category: 'Real-time media',
    tech: ['Flutter', 'Dart', 'WebRTC', 'WebSockets', 'Audio streaming'],
    highlights: [
      'Video rendering, peer connections and data channels',
      'Audio input with audio-level notifications',
      'Connection and speaking state',
      'Retry behaviour and configurable timeouts',
    ],
    install: 'flutter pub add simli_client',
    repo: 'https://github.com/jemisgoti/simli-flutter-client',
    featured: true,
  ),
  Package(
    name: 'visual_feedback',
    tagline: 'In-app bug reports with annotated screenshots.',
    description:
        'Users draw on a screenshot of the live app — pencil, brush, lines, shapes, arrows and text — '
        'and the developer receives the annotated PNG together with recent logs.',
    category: 'Developer tooling',
    tech: ['Flutter', 'Dart', 'Annotation', 'Logging'],
    highlights: [
      'Eight annotation tools, every mark stays editable',
      'One undo history across all tools',
      'Attach recent logs from package:logging',
      'Android, iOS, web, macOS, Windows and Linux',
    ],
    install: 'flutter pub add visual_feedback',
    repo: 'https://github.com/jemisgoti/visual_feedback',
    demo: 'https://jemisgoti.github.io/visual_feedback/',
    note: 'Early release',
    featured: true,
  ),
  Package(
    name: 'hyper_lint',
    tagline: 'Stricter conventions for Dart & Flutter codebases.',
    description:
        'A configurable linting toolkit for Dart and Flutter projects, designed to enforce stronger '
        'engineering conventions and catch common issues early. Integrates through analysis_options.yaml.',
    category: 'Static analysis',
    tech: ['Dart', 'Flutter', 'Static analysis'],
    repo: 'https://github.com/jemisgoti/hyper_lint',
  ),
  Package(
    name: 'simple_ripple_animation',
    tagline: 'Customisable ripple animations around any widget.',
    description:
        'A lightweight Flutter widget for creating customisable ripple animations around a child widget.',
    category: 'Animation',
    tech: ['Flutter', 'Dart', 'Animation'],
    install: 'flutter pub add simple_ripple_animation',
    repo: 'https://github.com/jemisgoti/simple_ripple_animation',
    note: 'Maintained with Furkan Arslan',
  ),
  Package(
    name: 'slick_carousel',
    tagline: 'A controller-driven carousel for Flutter.',
    description:
        'A slick-slider style carousel component for Flutter with a controller-based API and configurable '
        'navigation, spacing and item behaviour.',
    category: 'UI components',
    tech: ['Flutter', 'Dart', 'UI components'],
    install: 'flutter pub add slick_carousel',
    repo: 'https://github.com/jemisgoti/slick_carousel',
  ),
];

// ---------------------------------------------------------------------------
// Work
// ---------------------------------------------------------------------------

class Project {
  const Project({
    required this.title,
    required this.category,
    required this.summary,
    required this.tech,
    this.period,
    this.status,
    this.details = const [],
    this.links = const [],
  });

  final String title;
  final String category;
  final String summary;
  final List<String> tech;
  final String? period;
  final String? status;
  final List<String> details;
  final List<LinkRef> links;

  String get slug => title.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '-').replaceAll(RegExp(r'^-|-$'), '');
}

const projects = [
  Project(
    title: 'Simli Flutter Client',
    category: 'Real-time media · Open source',
    summary:
        'A Flutter/WebRTC client for integrating real-time AI avatars and conversational video '
        'experiences into Flutter apps.',
    tech: ['Flutter', 'WebRTC', 'AI avatars', 'WebSockets'],
    details: [
      'Handles peer connections, data channels and video rendering.',
      'Streams audio input and reports audio levels and speaking state.',
      'Exposes connection state with retry behaviour and configurable timeouts.',
    ],
    links: [
      LinkRef('GitHub', 'https://github.com/jemisgoti/simli-flutter-client'),
      LinkRef('pub.dev', 'https://pub.dev/packages/simli_client'),
    ],
  ),
  Project(
    title: 'Digital Stethoscope',
    category: 'Healthcare · Connected hardware',
    period: '2020–2021',
    summary:
        'Worked on a tubeless digital stethoscope, combining mobile software with connected medical hardware.',
    tech: ['Mobile', 'Bluetooth', 'Audio', 'Connected hardware'],
  ),
  Project(
    title: 'Agricare',
    category: 'IoT · Smart farming',
    summary:
        'A mobile control and monitoring layer for connected agricultural infrastructure.',
    tech: ['Flutter', 'Firebase', 'IoT', 'Machine learning'],
    details: [
      'Remote pump control from the app.',
      'Temperature, pressure, humidity and soil-moisture monitoring.',
      'Machine-learning analysis of the collected sensor data.',
    ],
  ),
  Project(
    title: 'visual_feedback',
    category: 'Developer tooling · Flutter package',
    status: 'Early release',
    summary:
        'Visual, contextual bug reporting for Flutter: users annotate a screenshot of the live app and '
        'the report arrives with recent logs attached.',
    tech: ['Flutter', 'Annotation', 'Bug reporting', 'Logging'],
    links: [
      LinkRef('Live demo', 'https://jemisgoti.github.io/visual_feedback/'),
      LinkRef('GitHub', 'https://github.com/jemisgoti/visual_feedback'),
      LinkRef('pub.dev', 'https://pub.dev/packages/visual_feedback'),
    ],
  ),
  Project(
    title: 'Weapon Detection System',
    category: 'Computer vision · Earlier project',
    summary:
        'An exploration of computer vision for public-safety monitoring: detecting weapons in CCTV imagery '
        'and notifying the responsible authorities.',
    tech: ['TensorFlow', 'IBM Cloud Annotations', 'Computer vision'],
    links: [LinkRef('GitHub', 'https://github.com/jemisgoti/weapon-detection')],
  ),
];

class Engagement {
  const Engagement({required this.title, required this.summary});
  final String title;
  final String summary;
}

const engagements = [
  Engagement(
    title: 'Enterprise & government',
    summary:
        'Experienced in delivering complex mobile and software solutions for enterprise environments and '
        'government-related projects, including work for the Government of the UAE.',
  ),
  Engagement(
    title: 'World Health Organization',
    summary: 'Contributed as a Flutter developer to the WHO official app in a volunteer capacity.',
  ),
  Engagement(
    title: 'Payments & Google APIs',
    summary:
        'Payment gateway and Google API integrations as part of production-oriented mobile engineering.',
  ),
];

// ---------------------------------------------------------------------------
// Research
// ---------------------------------------------------------------------------

abstract final class Research {
  static const title = 'Smart Farming Support System Using IoT';
  static const venue = 'Psychology and Education Journal';
  static const issue = 'Volume 58, No. 5';
  static const year = '2021';
  static const summary =
      'A system that lets farmers monitor environmental data and control agricultural equipment remotely, '
      'with real-time monitoring and intrusion detection.';
  static const pipeline = ['IoT', 'Sensors', 'Flutter', 'Maps', 'Machine learning', 'Agriculture'];
  static const hardware = ['ESP32', 'Humidity sensor', 'BMP180 pressure sensor', 'PIR motion sensor'];
  static const software = ['Flutter', 'Google Maps', 'Machine learning'];
}

// ---------------------------------------------------------------------------
// Writing
// ---------------------------------------------------------------------------

class Article {
  const Article({
    required this.title,
    required this.platform,
    required this.category,
    required this.url,
    required this.topics,
    this.date,
  });

  final String title;
  final String platform;
  final String category;
  final String url;
  final List<String> topics;
  final DateTime? date;
}

final articles = [
  Article(
    title: 'Flutter 3.16: A Deep Dive into Material 3, Impeller for Android, and More!',
    platform: 'Medium',
    category: 'Flutter',
    date: DateTime(2023, 11, 19),
    url: 'https://medium.com/@jemisgoti/flutter-3-16-a-deep-dive-into-material-3-impeller-for-android-and-more-921b298a1fd7',
    topics: ['Material 3', 'Impeller', 'DevTools extensions', 'Dart 3.2'],
  ),
  Article(
    title: 'Firebase Dynamic Links Deprecation: What Developers Need to Know',
    platform: 'Medium',
    category: 'Deep Linking',
    date: DateTime(2023, 11, 10),
    url: 'https://medium.com/@jemisgoti/firebase-dynamic-links-deprecation-what-developers-need-to-know-c47ef5c3e518',
    topics: ['Migration', 'App Links', 'Universal Links'],
  ),
  Article(
    title: 'Why Choose Flutter for Your Next App Development: A Comprehensive Guide',
    platform: 'LinkedIn',
    category: 'Flutter',
    date: DateTime(2023, 11, 3),
    url: 'https://www.linkedin.com/in/jemis-goti/recent-activity/articles/',
    topics: ['Cross-platform', 'Mobile engineering'],
  ),
  Article(
    title: "Google Play's Account Deletion Requirements: What Developers Need to Know",
    platform: 'LinkedIn',
    category: 'App Distribution',
    date: DateTime(2023, 10, 28),
    url: 'https://www.linkedin.com/pulse/google-plays-account-deletion-requirements-what-developers-jemis-goti-viayf',
    topics: ['User Data policy', 'Data deletion', 'Compliance'],
  ),
  Article(
    title: 'Google Play New Testing Requirements: What Developers Need to Know',
    platform: 'Medium',
    category: 'App Distribution',
    url: 'https://medium.com/@jemisgoti/google-play-new-testing-requirements-what-developers-need-to-know-30dc84b97620',
    topics: ['Closed testing', 'Production access', 'Android publishing'],
  ),
];

// ---------------------------------------------------------------------------
// About
// ---------------------------------------------------------------------------

abstract final class Education {
  static const school = 'Birla Vishvakarma Mahavidyalaya';
  static const period = '2016–2020';
}

class Certification {
  const Certification(this.title, this.issuer, [this.date]);
  final String title;
  final String issuer;
  final String? date;
}

const certifications = [
  Certification('Applied Data Science with Python', 'IBM', 'Jan 2020'),
  Certification('Deep Learning with TensorFlow', 'IBM', 'Nov 2019'),
  Certification('Machine Learning with Python', 'IBM', 'Nov 2019'),
  Certification('PHP Web Application on a LAMP Stack', 'IBM', 'Nov 2019'),
  Certification('Python for Data Science', 'IBM', 'Oct 2019'),
  Certification('Advanced Algorithm', 'Stanford University', 'Jun 2019'),
  Certification('Algorithms', 'Stanford University'),
];

const knowsAbout = [
  'Flutter',
  'Dart',
  'Flutter FFI',
  'Platform Channels',
  'Native SDK integration',
  'Bluetooth Low Energy',
  'WebRTC',
  'Audio streaming',
  'TensorFlow Lite',
  'Internet of Things',
  'Developer tooling',
  'Open-source Flutter packages',
];
