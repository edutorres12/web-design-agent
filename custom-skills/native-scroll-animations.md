# Native Scroll Animations — Apple.com Style

## Philosophy

**Zero animation libraries. Pure CSS + vanilla JavaScript only.**

Apple.com ships world-class scroll animations without GSAP, Framer Motion, or any library.
Their secret: `IntersectionObserver`, `scroll` events + `requestAnimationFrame`, CSS transitions,
CSS `@keyframes`, `position: sticky`, and the Web Animations API.

This is the standard for all projects. No third-party animation dependencies.

---

## Core Techniques

### 1. Scroll Reveal (IntersectionObserver)

The foundation. Elements animate in when they enter the viewport.

```javascript
function initReveals() {
  var els = document.querySelectorAll('.reveal');
  var obs = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        entry.target.classList.add('is-visible');
        obs.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1, rootMargin: '0px 0px -30px 0px' });
  els.forEach(function (el) { obs.observe(el); });
}
```

```css
.reveal {
  opacity: 0;
  transform: translateY(16px);
  transition: opacity 0.7s cubic-bezier(0.25, 0.1, 0.25, 1),
              transform 0.7s cubic-bezier(0.25, 0.1, 0.25, 1);
}
.reveal.is-visible {
  opacity: 1;
  transform: translateY(0);
}
```

### 2. Staggered Reveals (CSS delay)

Group related elements and stagger with `transition-delay`:

```css
.reveal-stagger > .reveal:nth-child(1) { transition-delay: 0ms; }
.reveal-stagger > .reveal:nth-child(2) { transition-delay: 100ms; }
.reveal-stagger > .reveal:nth-child(3) { transition-delay: 120ms; }
/* ... */
```

Or dynamically with IntersectionObserver + setTimeout:

```javascript
var section = document.querySelector('.cards-section');
var cards = section.querySelectorAll('.card');
var obs = new IntersectionObserver(function (entries) {
  entries.forEach(function (entry) {
    if (entry.isIntersecting) {
      cards.forEach(function (card, i) {
        setTimeout(function () {
          card.classList.add('is-visible');
        }, i * 150);
      });
      obs.unobserve(entry.target);
    }
  });
}, { threshold: 0.15 });
obs.observe(section);
```

### 3. Scroll-Linked Animations (scroll + rAF)

For parallax, progress bars, scrub-style animations — map scroll position to CSS values.

```javascript
var heroSection = document.querySelector('.hero');
var heroBg = document.querySelector('.hero__bg');
var ticking = false;

window.addEventListener('scroll', function () {
  if (!ticking) {
    ticking = true;
    requestAnimationFrame(function () {
      var rect = heroSection.getBoundingClientRect();
      var progress = Math.min(Math.max(-rect.top / heroSection.offsetHeight, 0), 1);
      heroBg.style.transform = 'translate3d(0,' + (progress * 15) + '%,0)';
      ticking = false;
    });
  }
}, { passive: true });
```

**Key patterns:**
- Always throttle with `requestAnimationFrame` (one rAF per scroll)
- Use `{ passive: true }` on scroll listeners
- Only animate `transform` and `opacity` (compositor-only)
- Use `translate3d()` to force GPU compositing
- Calculate progress as 0→1 ratio based on element position

### 4. SVG Line Draw on Scroll

For timeline/path animations — map scroll to `strokeDashoffset`:

```javascript
var svg = document.getElementById('timeline-line');
var line = svg.querySelector('line');
var lineLength = svg.getBoundingClientRect().height;
line.style.strokeDasharray = lineLength;
line.style.strokeDashoffset = lineLength;

window.addEventListener('scroll', function () {
  requestAnimationFrame(function () {
    var rect = svg.getBoundingClientRect();
    var winH = window.innerHeight;
    var scrolled = (winH * 0.75) - rect.top;
    var total = rect.height;
    var progress = Math.min(Math.max(scrolled / total, 0), 1);
    line.style.strokeDashoffset = lineLength * (1 - progress);
  });
}, { passive: true });
```

### 5. CSS Sticky Horizontal Scroll (no JS pin)

Replace GSAP ScrollTrigger.pin with native `position: sticky`:

```css
.gallery-wrapper {
  height: 300vh; /* scroll distance */
}
.gallery-sticky {
  position: sticky;
  top: 0;
  height: 100vh;
  overflow: hidden;
}
.gallery-track {
  display: flex;
  gap: 24px;
  will-change: transform;
  transition: none; /* JS handles transform */
}
```

```javascript
var wrapper = document.querySelector('.gallery-wrapper');
var track = document.querySelector('.gallery-track');
var ticking = false;

window.addEventListener('scroll', function () {
  if (!ticking) {
    ticking = true;
    requestAnimationFrame(function () {
      var rect = wrapper.getBoundingClientRect();
      var scrollRange = wrapper.offsetHeight - window.innerHeight;
      var progress = Math.min(Math.max(-rect.top / scrollRange, 0), 1);
      var maxShift = track.scrollWidth - window.innerWidth;
      track.style.transform = 'translate3d(' + (-progress * maxShift) + 'px,0,0)';
      ticking = false;
    });
  }
}, { passive: true });
```

### 6. Smooth Interpolation (lerp)

For buttery smooth scroll-linked animations, use linear interpolation:

```javascript
var currentX = 0;
var targetX = 0;

function lerp(a, b, t) { return a + (b - a) * t; }

function animate() {
  currentX = lerp(currentX, targetX, 0.08); // 0.05-0.12 = smooth range
  track.style.transform = 'translate3d(' + currentX + 'px,0,0)';
  requestAnimationFrame(animate);
}
animate();

window.addEventListener('scroll', function () {
  // Update targetX based on scroll position
  var progress = /* ... */;
  targetX = -progress * maxShift;
}, { passive: true });
```

### 7. CSS @keyframes for Looping/Complex Sequences

For loader animations, floating elements, pulse effects:

```css
@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(20px); }
  to   { opacity: 1; transform: translateY(0); }
}

.hero__title {
  animation: fadeInUp 0.8s cubic-bezier(0.25, 0.1, 0.25, 1) 0.2s both;
}
.hero__subtitle {
  animation: fadeInUp 0.8s cubic-bezier(0.25, 0.1, 0.25, 1) 0.35s both;
}
```

### 8. CSS Scroll-Snap for Section Locking

When you need snap-to-section behavior:

```css
.scroll-container {
  scroll-snap-type: y mandatory;
  overflow-y: scroll;
  height: 100vh;
}
.section {
  scroll-snap-align: start;
  height: 100vh;
}
```

---

## Performance Rules

1. **Only animate `transform` and `opacity`** — these are compositor-only, GPU-accelerated
2. **Never animate `width`, `height`, `top`, `left`, `margin`, `padding`** — causes layout thrash
3. **Use `will-change: transform`** on elements that will be animated (sparingly)
4. **One rAF per scroll event** — throttle with a `ticking` boolean
5. **`{ passive: true }`** on all scroll/touch listeners
6. **`translate3d()` over `translateX()/translateY()`** — forces GPU layer
7. **Respect `prefers-reduced-motion`** — disable all motion animations

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

```javascript
var prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
if (prefersReduced) return; // skip all scroll animations
```

---

## Apple.com Patterns to Study

- **iPhone product pages**: Scroll-linked opacity + scale transitions, text reveals timed to scroll position
- **AirPods page**: Sticky sections with scroll-mapped video frame scrubbing
- **MacBook page**: Parallax depth layers with different scroll speeds
- **Apple Watch page**: Number counters, progressive reveals, section color transitions
- **Homepage**: Simple IntersectionObserver reveals with staggered timing

**Key Apple principles:**
- Animations serve the story, never decorate
- Easing is always smooth — never bounce or elastic
- Transitions are fast (300-600ms for UI, up to 1s for scroll reveals)
- Everything uses `transform` and `opacity` only
- Progressive enhancement — content is visible without JS

---

## When to Use Each Technique

| Need | Technique |
|------|-----------|
| Element enters viewport → animate in | IntersectionObserver + CSS transition |
| Group of elements animate in sequence | IntersectionObserver + staggered setTimeout |
| Parallax / scroll-speed difference | scroll event + rAF + transform |
| Progress bar / line draw on scroll | scroll event + rAF + CSS property |
| Horizontal scroll section | CSS sticky + scroll event + rAF |
| Page load sequence | CSS @keyframes with animation-delay |
| Hover / focus micro-interactions | CSS :hover / :focus transitions |
| Section snap | CSS scroll-snap-type |
| Smooth scroll-linked motion | scroll event + rAF + lerp interpolation |

---

## NEVER Use

- GSAP (gsap.min.js, ScrollTrigger, SplitText, etc.)
- anime.js
- Locomotive Scroll
- AOS (Animate On Scroll)
- Any CDN animation library

**Why:** External animation libraries add 30-100KB+ of JavaScript, create dependency on third-party code, and every technique they provide can be achieved natively with better performance. Apple.com proves this at scale.
