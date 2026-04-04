# /animate — Add Motion & Scroll Animations

Read the current code and add purposeful motion:

## Animation Layers (apply in order):

### 1. Page Load Sequence
- Staggered entrance of hero elements (title -> subtitle -> CTA)
- Duration: 400-800ms per element
- Stagger: 100-150ms between elements
- Easing: cubic-bezier(0.25, 0.1, 0.25, 1)

### 2. Scroll Reveals
- Use GSAP ScrollTrigger (read skills/gsap-skills)
- Elements fade up + slight translate as they enter viewport
- trigger: "top 85%", once: true
- Stagger groups of related elements

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

Use skills/gsap-skills for vanilla JS projects.
Use skills/framer-motion or skills/motion-dev for React projects.
Use skills/animate-skill for Emil Kowalski-style motion.
