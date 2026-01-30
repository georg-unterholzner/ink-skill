#!/bin/bash

# Build AGENTS.md by concatenating all skill files
# Run from repository root

# Change to ink-skill directory
SKILL_DIR="ink-skill"

if [ ! -d "$SKILL_DIR" ]; then
    echo "Error: $SKILL_DIR directory not found"
    echo "This script must be run from the repository root"
    exit 1
fi

cd "$SKILL_DIR"

OUTPUT="AGENTS.md"

# Remove existing output file
rm -f "$OUTPUT"

# Add header
cat > "$OUTPUT" << 'EOF'
# Ink - React for CLIs

Complete reference documentation for Ink. This file is auto-generated from individual skill files.

---

EOF

# Add main SKILL.md (without frontmatter)
echo "## Main Documentation" >> "$OUTPUT"
echo "" >> "$OUTPUT"
tail -n +4 SKILL.md >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "---" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Add Components
echo "## Components Reference" >> "$OUTPUT"
echo "" >> "$OUTPUT"

for file in components/*.md; do
    echo "### $(basename "$file" .md)" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    cat "$file" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "---" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
done

# Add Hooks
echo "## Hooks Reference" >> "$OUTPUT"
echo "" >> "$OUTPUT"

for file in hooks/*.md; do
    echo "### $(basename "$file" .md)" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    cat "$file" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "---" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
done

# Add API
echo "## API Reference" >> "$OUTPUT"
echo "" >> "$OUTPUT"

for file in api/*.md; do
    echo "### $(basename "$file" .md)" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    cat "$file" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "---" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
done

# Add Guides
echo "## Guides" >> "$OUTPUT"
echo "" >> "$OUTPUT"

for file in guides/*.md; do
    echo "### $(basename "$file" .md)" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    cat "$file" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "---" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
done

echo "✓ Generated $SKILL_DIR/$OUTPUT"
