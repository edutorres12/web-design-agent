# Research-First Design Workflow

## MANDATORY RULE — applies to EVERY design request

**NEVER design from imagination alone.** Always research first, then design based on real references.

This is THE most important part of the entire design process. Without real references, the output will always feel AI-generated. With references, it feels hand-crafted by a professional.

This is how professional designers work: they study the best existing work, extract patterns, and adapt them to the client's needs. Claude's "creativity" is limited — real-world references make designs 10x better.

---

## Phase 0: Research (BEFORE Phase 1 of the Design Pipeline)

**This is the KEY phase. Spend the most effort here. Everything else flows from this.**

### Step 1: Web Search for Best Similar Sites

For every design request, run **5-8 targeted searches** using `WebSearch`:

```
Search queries to run (adapt to the request):
1. "best [type of site] website design 2025 2026"
2. "award winning [type of site] website"
3. "[type of site] website design inspiration awwwards"
4. "[type of site] web design dribbble behance"
5. "[industry/niche] landing page examples"
6. "godly.website [type of site]"
7. "[type of site] website design siteinspire"
8. "[type of site] web design minimal modern"
```

**Sources to search:**
- Awwwards (awwwards.com) — Award-winning design
- CSS Design Awards (cssdesignawards.com)
- Dribbble (dribbble.com) — UI/visual concepts
- Behance (behance.net) — Full case studies
- SiteInspire (siteinspire.com) — Curated galleries
- Godly (godly.website) — Best of the best
- Landbook (land-book.com) — Landing pages
- One Page Love (onepagelove.com) — Single page sites
- Lapa Ninja (lapa.ninja) — Landing page gallery
- Minimal Gallery (minimal.gallery) — Minimalist sites
- Httpster (httpster.net) — Indie/creative sites
- Dark Mode Design (darkmodedesign.com) — Dark UI inspiration

### Step 2: Pinterest Inspiration

Search Pinterest for visual mood/direction using `WebFetch`:

```
Pinterest searches to run:
1. "[type of site] website design"
2. "[type of site] UI design"
3. "[type of site] landing page inspiration"
4. "[aesthetic/style] web design"
5. "[type of site] color palette website"
```

Use: `https://pinterest.com/search/pins/?q=[query]`

### Step 3: Fetch & Analyze Top References (THE CRITICAL STEP)

For the **top 5-8 sites found**, use `WebFetch` to actually visit each site and:

**Visual Analysis (via screenshots/images when possible):**
- Capture screenshots or look at thumbnail images of the sites
- Analyze the visual composition, density, and rhythm
- Study the hero section layout and impact
- Observe spacing patterns and whitespace usage

**Technical Extraction:**
- Extract their exact color palette (hex/oklch values from CSS)
- Identify their typography choices (font families, sizes, weights)
- Map their layout structure (grid system, asymmetry, section flow)
- Catalog their animation/motion strategy (easing, timing, triggers)
- Note their visual tone (warm/cool, light/dark, dense/airy)
- Study their component patterns (cards, buttons, nav, footer)

**Code Analysis (when accessible):**
- Look at their HTML structure for layout patterns
- Check their CSS for design tokens, custom properties, gradients
- Note their JS libraries (GSAP, Framer Motion, etc.)
- Extract reusable patterns

### Step 4: Analyze Screenshots & Images

**If the user provides images, screenshots, or URLs of designs they like:**
- Use `Read` tool to view images directly (supports PNG, JPG, etc.)
- Use `WebFetch` to capture site screenshots when possible
- Analyze every visual detail: spacing, colors, typography, layout, shadows, borders
- Extract the design system from the visual reference
- Identify the "feel" — what makes it look professional vs. generic

**This is KEY: Being able to SEE and ANALYZE real designs is what separates good output from generic AI slop.**

### Step 5: Create a Reference Brief

Before writing ANY code, document:

```markdown
## Reference Brief

### Sites Analyzed:
1. [site-name.com] — What I'm taking: [specific element]
2. [site-name.com] — What I'm taking: [specific element]
3. [site-name.com] — What I'm taking: [specific element]
4. [site-name.com] — What I'm taking: [specific element]
5. [site-name.com] — What I'm taking: [specific element]

### Visual DNA (from image/screenshot analysis):
- **Density:** [airy / balanced / dense]
- **Tone:** [warm / neutral / cool]
- **Contrast:** [high / medium / subtle]
- **Geometry:** [rounded / mixed / sharp]
- **Texture:** [flat / subtle depth / layered]

### Design Decisions Based on References:
- **Layout:** Inspired by [site] — [describe pattern]
- **Typography:** Saw [font pairing] on [site], adapting to [our choice]
- **Color:** [site] uses [palette description], adapting to [our palette]
- **Motion:** [site] has [animation style], we'll use [our approach]
- **Hero section:** Based on [site]'s approach of [description]
- **Components:** [site]'s [component] pattern adapted as [our version]
- **Unique twist:** [What we're changing/combining to make it our own]
```

### Step 6: Present References to User

Show the user:
1. The top 5-8 reference sites found (with clickable URLs)
2. What specific elements we're taking from each
3. How we'll combine/adapt them for their project
4. 2-3 design directions based on different reference combinations
5. For each direction: font pairing, color palette preview, layout sketch description, motion strategy

**Wait for user approval before proceeding to Phase 1.**

---

## How This Changes the Pipeline

```
OLD: Phase 1 (Direction) → Phase 2 (Build) → Phase 3 (Animate) → Phase 4 (Polish)
NEW: Phase 0 (Research) → Phase 1 (Direction) → Phase 2 (Build) → Phase 3 (Animate) → Phase 4 (Polish)
         ↑ THIS IS 40% OF THE WORK
```

Phase 0 feeds directly into Phase 1. The design directions in Phase 1 are now **grounded in real references**, not abstract ideas.

---

## Image & Screenshot Analysis Capabilities

**What I can analyze:**
- Screenshots of websites (PNG, JPG, WebP)
- Dribbble/Behance mockup images
- Pinterest pins and boards
- Figma export screenshots
- Any visual reference the user provides
- Live site screenshots via WebFetch

**What I extract from images:**
- Color values and palette structure
- Typography style (serif/sans, weight contrast, scale)
- Layout grid and spacing rhythm
- Component patterns and visual hierarchy
- Shadow and depth treatment
- Border radius and geometric language
- Overall visual "feel" and personality

---

## Rules

1. **NEVER skip Phase 0.** Even for "simple" requests. This is THE most important phase.
2. **ALWAYS show references to the user** before designing.
3. **Be specific** about what you're taking from each reference (don't just say "inspired by").
4. **Combine, don't copy.** Take layout from site A, typography approach from site B, color strategy from site C.
5. **Adapt to context.** A restaurant site reference can inspire a hotel site, but adapt the patterns.
6. **Pinterest is for mood/aesthetic**, web searches are for structural/technical references.
7. **Focus creativity on remixing** — combining references in new ways, not inventing from scratch.
8. **If the user provides images/screenshots, analyze them FIRST** — they are the highest-priority reference.
9. **Fetch actual sites, don't just list URLs.** Visit them, read their code, study their design.
10. **More references = better output.** Aim for 5-8 analyzed sites, not just 2-3.
