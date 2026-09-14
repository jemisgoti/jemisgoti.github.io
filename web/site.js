(() => {
  const root = document.documentElement;

  // Theme toggle
  const themeMeta = document.querySelector('meta[name="theme-color"]');
  const syncThemeColor = () => {
    if (themeMeta) themeMeta.content = root.dataset.theme === 'dark' ? '#0e0e0d' : '#f4f3ee';
  };
  syncThemeColor();
  document.querySelector('[data-theme-toggle]')?.addEventListener('click', () => {
    const next = root.dataset.theme === 'dark' ? 'light' : 'dark';
    root.dataset.theme = next;
    try { localStorage.setItem('theme', next); } catch (_) {}
    syncThemeColor();
  });

  // Mobile navigation
  const header = document.querySelector('.site-header');
  const navToggle = document.querySelector('[data-nav-toggle]');
  const setNav = (open) => {
    header?.classList.toggle('is-open', open);
    navToggle?.setAttribute('aria-expanded', String(open));
    navToggle?.setAttribute('aria-label', open ? 'Close menu' : 'Open menu');
  };
  navToggle?.addEventListener('click', () => setNav(!header.classList.contains('is-open')));
  document.addEventListener('keydown', (e) => { if (e.key === 'Escape') setNav(false); });
  document.querySelectorAll('.site-nav a').forEach((link) => link.addEventListener('click', () => setNav(false)));

  // Header border once the page scrolls
  const onScroll = () => header?.classList.toggle('is-scrolled', window.scrollY > 8);
  onScroll();
  window.addEventListener('scroll', onScroll, { passive: true });

  // Copy install commands
  document.querySelectorAll('[data-copy]').forEach((btn) => {
    btn.addEventListener('click', async () => {
      try {
        await navigator.clipboard.writeText(btn.dataset.copy);
        btn.classList.add('is-copied');
        setTimeout(() => btn.classList.remove('is-copied'), 1600);
      } catch (_) {}
    });
  });

  // Subtle reveal on scroll
  const items = document.querySelectorAll('[data-reveal]');
  const reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  if (!('IntersectionObserver' in window) || reduced) return;
  root.classList.add('reveal-ready');
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (!entry.isIntersecting) return;
      entry.target.classList.add('is-visible');
      observer.unobserve(entry.target);
    });
  }, { rootMargin: '0px 0px -8% 0px', threshold: 0.08 });
  items.forEach((item) => {
    if (item.getBoundingClientRect().top < window.innerHeight) item.classList.add('is-visible');
    else observer.observe(item);
  });
})();
