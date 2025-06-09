// Performance optimization script
document.addEventListener('DOMContentLoaded', function() {
  // Lazy loading for images
  if ('loading' in HTMLImageElement.prototype) {
    const images = document.querySelectorAll('img[loading="lazy"]');
    images.forEach(img => {
      if (img.dataset.src) {
        img.src = img.dataset.src;
      }
    });
  } else {
    // Fallback for browsers that don't support lazy loading
    const script = document.createElement('script');
    script.src = 'https://cdn.jsdelivr.net/npm/lazysizes@5.3.2/lazysizes.min.js';
    document.body.appendChild(script);
  }

  // Intersection Observer for animations
  const observerOptions = {
    root: null,
    rootMargin: '0px',
    threshold: 0.1
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  // Observe all articles and section headings
  document.querySelectorAll('article, h1, h2, h3').forEach(el => {
    el.classList.add('fade-in');
    observer.observe(el);
  });

  // Performance metrics
  if ('performance' in window && 'PerformanceObserver' in window) {
    const observer = new PerformanceObserver((list) => {
      for (const entry of list.getEntries()) {
        // Log FCP for monitoring
        if (entry.name === 'first-contentful-paint') {
          console.log(`FCP: ${entry.startTime}`);
        }
      }
    });
    observer.observe({ entryTypes: ['paint'] });
  }
});
