# Ink Skill

A comprehensive Agent Skill for building CLI applications with [Ink](https://github.com/vadimdemedes/ink) - React for CLIs.

## How It Works

This skill uses progressive disclosure to minimize token usage. Instead of loading all 2,500 lines of documentation upfront, it loads:

- **Discovery** (~100 tokens): Just the skill description when idle
- **Navigation** (~800 tokens): `SKILL.md` with quick reference index when triggered
- **Details** (~200-800 tokens): Individual documentation files only when needed

## Installation

Copy the `ink-skill/` directory to your AI agent's skills directory. Refer to your agent's documentation for the correct installation location.

## Usage

This skill activates when building CLI applications with Ink.

The skill triggers automatically when:
- Building CLI tools with Ink/React
- Using Ink components (`<Text>`, `<Box>`, `<Static>`)
- Implementing terminal-based layouts with flexbox
- Adding borders, colors, or styling to terminal output
- Handling keyboard input in CLI applications with `useInput`

You can also request specific sections:
- "Show me Box layout properties" → loads `components/box-layout.md`
- "How do I handle keyboard input in Ink?" → loads `hooks/input.md`
- "How to test Ink components?" → loads `guides/testing.md`
- "Add a border to my CLI component" → loads `components/box-styling.md`

## Repository Structure

```
ink-skill/                      (repository root)
├── build-agent-md.sh           # Generate complete reference
├── validate-correctness.sh     # Validate against original docs
├── LICENSE
└── ink-skill/                  # Install this directory
    ├── SKILL.md                # Main entry point
    ├── components/             # <Text>, <Box>, <Static>, etc.
    ├── hooks/                  # useInput, useFocus, etc.
    ├── api/                    # render(), measureElement()
    └── guides/                 # Accessibility, testing, devtools
```

## Development

In order to update this repo after a new release of the docs:

1. **Copy original documentation** from [Ink repository](https://github.com/vadimdemedes/ink/).
2. **Use AI agent** to split documentation into organized subfiles and generate `SKILL.md`.
3. **Run validation** to verify correctness and inspect deviations:
   ```bash
   ./validate-correctness.sh <path-to-original-documentation>
   ```
   The validator checks that 80%+ of each file's content exists in the original documentation. Deviations are intentional (heading changes, cross-references, file splits).

## License

MIT - See [LICENSE](LICENSE) file for details.
