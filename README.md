# Web Design Agent

A premium web design agent powered by 16+ curated skills for Claude Code. Creates websites that look hand-crafted, NOT AI-generated.

## Quick Start

```bash
git clone --recurse-submodules https://github.com/edutorres12/web-design-agent
cd web-design-agent
chmod +x install.sh update.sh
./install.sh
```

## Usage

Once installed, the skills are available globally in any Claude Code project:

```bash
cd your-project/
claude

> /design    # Full design pipeline
> /polish    # Refine existing design
> /audit     # Quality check
> /animate   # Add motion & scroll animations
```

## Skills (16)

### Core — Anti-Generic Design
| Skill | Source | Stars |
|-------|--------|-------|
| Impeccable | pbakaus/impeccable | 15.8k |
| UI/UX Pro Max | nextlevelbuilder/ui-ux-pro-max-skill | 58k |
| Design for AI | ryanthedev/design-for-ai | — |
| Interface Design | Dammyjay93/interface-design | — |

### Animation & Motion
| Skill | Source | Stars |
|-------|--------|-------|
| GSAP Skills | greensock/gsap-skills | 2.1k |
| Animate Skill | delphi-ai/animate-skill | — |
| Framer Motion | Schoepplake/framer-motion-skill | — |
| Motion.dev | 199-biotechnologies/motion-dev-animations-skill | — |
| Claude Design Skills | freshtechbro/claudedesignskills | — |

### Specialists
| Skill | Source | Stars |
|-------|--------|-------|
| Color Expert | meodai/skill.color-expert | — |
| Google Fonts | sliday/google-fonts-skill | — |
| Stitch Kit | gabelul/stitch-kit | — |
| Design with Claude | imsaif/design-with-claude | — |

### Quality Assurance
| Skill | Source | Stars |
|-------|--------|-------|
| Vercel Agent Skills | vercel-labs/agent-skills | 24.4k |
| A11y Skill | airowe/claude-a11y-skill | — |
| UI Motion Perf | ibelick/ui-skills | — |

## Custom Skills

Add your own skills in `custom-skills/`:

```bash
mkdir custom-skills/my-skill
# Create custom-skills/my-skill/SKILL.md
./install.sh  # Re-install to pick up new skill
```

## Update

```bash
./update.sh  # Pulls latest from all 16 repos + re-installs
```

## License

MIT
