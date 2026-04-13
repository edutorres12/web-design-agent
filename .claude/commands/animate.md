# /animate — Add Motion & Scroll Animations

Read the current code and add purposeful motion:

## Animation Layers (apply in order):

### 1. Page Load Sequence
- Staggered entrance of hero elements (title -> subtitle -> CTA)
- Duration: 400-800ms per element
- Stagger: 100-150ms between elements
- Easing: cubic-bezier(0.25, 0.1, 0.25, 1)

### 2. Scroll Reveals
- Use IntersectionObserver (read custom-skills/native-scroll-animations.md)
- Elements fade up + slight translate as they enter viewport
- threshold: 0.1, rootMargin: '0px 0px -30px 0px', observe once
- Stagger groups with setTimeout delays or CSS transition-delay

### 3. Parallax
- Subtle parallax on hero images (0.1-0.3 speed ratio)
- Background elements move slower than foreground
- NEVER parallax text (readability)

### 4. Hover Interactions
- Buttons: subtle scale(1.02) + shadow increase
- Cards: slight lift + shadow
- Links: underline animation or color shift
- Duration: 200-300ms

### 5. Scroll Progress
- Optional: progress bar or indicator
- Background color shifts on scroll

Use custom-skills/native-scroll-animations.md for vanilla JS projects (IntersectionObserver + scroll+rAF + CSS transitions — Apple.com style, zero dependencies).
Use skills/framer-motion or skills/motion-dev for React projects.
Use skills/animate-skill for Emil Kowalski-style motion.

**IMPORTANT: Never use GSAP or any external animation CDN. All scroll animations must be pure CSS + vanilla JS.**
