#!/bin/bash

# Validate that all skill files contain content from the original documentation
# Usage: ./validate-correctness.sh <path-to-original-documentation>
# Run from repository root

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if argument is provided
if [ $# -eq 0 ]; then
    echo -e "${RED}Error: No documentation file provided${NC}"
    echo "Usage: $0 <path-to-original-documentation>"
    exit 1
fi

ORIGINAL_DOC="$1"

# Check if original documentation exists
if [ ! -f "$ORIGINAL_DOC" ]; then
    echo -e "${RED}Error: File '$ORIGINAL_DOC' not found${NC}"
    exit 1
fi

# Check if ink-skill directory exists
SKILL_DIR="ink-skill"
if [ ! -d "$SKILL_DIR" ]; then
    echo -e "${RED}Error: $SKILL_DIR directory not found${NC}"
    echo "This script must be run from the repository root"
    exit 1
fi

echo -e "${YELLOW}Validating skill files against original documentation...${NC}"
echo "Original doc: $ORIGINAL_DOC"
echo "Skill dir: $SKILL_DIR"
echo ""

# Read original documentation into variable
ORIGINAL_CONTENT=$(cat "$ORIGINAL_DOC")

# Counter for validation
TOTAL_FILES=0
VALIDATED_FILES=0
FAILED_FILES=()

# Directories to check (relative to SKILL_DIR)
DIRECTORIES=("api" "components" "guides" "hooks")

# Files to skip (compiled/generated files that aren't direct copies)
SKIP_FILES=("third-party.md")

# Function to check if file should be skipped
should_skip() {
    local filename=$(basename "$1")
    for skip_file in "${SKIP_FILES[@]}"; do
        if [ "$filename" = "$skip_file" ]; then
            return 0
        fi
    done
    return 1
}

# Function to trim whitespace without xargs
trim() {
    local var="$1"
    # Remove leading whitespace
    var="${var#"${var%%[![:space:]]*}"}"
    # Remove trailing whitespace
    var="${var%"${var##*[![:space:]]}"}"
    echo "$var"
}

# Function to validate a file
validate_file() {
    local file="$1"
    local filename=$(basename "$file")
    local dirname=$(dirname "$file")

    # Check if file should be skipped
    if should_skip "$file"; then
        echo -e "${YELLOW}⊘${NC} $file (skipped - compiled list)"
        return 0
    fi

    TOTAL_FILES=$((TOTAL_FILES + 1))

    # Read file content (skip empty files)
    local file_content=$(cat "$file")

    if [ -z "$file_content" ]; then
        echo -e "${YELLOW}⚠ Skipping empty file: $file${NC}"
        return 0
    fi

    # Try to find a significant portion of the content
    # We'll check if at least 80% of non-empty lines from the file exist in the original

    local total_lines=0
    local found_lines=0

    while IFS= read -r line; do
        # Skip empty lines and very short lines (like "##" or "```")
        local trimmed_line=$(trim "$line")
        if [ ${#trimmed_line} -lt 5 ]; then
            continue
        fi

        total_lines=$((total_lines + 1))

        # Use grep with proper escaping
        # The -- ensures that lines starting with - aren't treated as options
        if echo "$ORIGINAL_CONTENT" | grep -F -q -- "$line" 2>/dev/null; then
            found_lines=$((found_lines + 1))
        fi
    done < "$file"

    # Calculate percentage
    if [ $total_lines -eq 0 ]; then
        echo -e "${YELLOW}⚠ Skipping file with no substantial content: $file${NC}"
        return 0
    fi

    local percentage=$((found_lines * 100 / total_lines))

    if [ $percentage -ge 80 ]; then
        echo -e "${GREEN}✓${NC} $file ($percentage% match)"
        VALIDATED_FILES=$((VALIDATED_FILES + 1))
        return 0
    else
        echo -e "${RED}✗${NC} $file ($percentage% match - FAILED)"
        FAILED_FILES+=("$file")
        return 1
    fi
}

# Change to skill directory
cd "$SKILL_DIR"

# Validate all files in specified directories
for dir in "${DIRECTORIES[@]}"; do
    if [ ! -d "$dir" ]; then
        echo -e "${YELLOW}⚠ Directory '$dir' not found, skipping${NC}"
        continue
    fi

    echo -e "\n${YELLOW}Checking $dir/${NC}"

    for file in "$dir"/*.md; do
        if [ -f "$file" ]; then
            validate_file "$file"
        fi
    done
done

# Print summary
echo ""
echo "================================"
echo -e "${YELLOW}Validation Summary${NC}"
echo "================================"
echo "Total files checked: $TOTAL_FILES"
echo -e "${GREEN}Validated: $VALIDATED_FILES${NC}"
echo -e "${RED}Failed: ${#FAILED_FILES[@]}${NC}"

# If there are failed files, list them and exit with error
if [ ${#FAILED_FILES[@]} -gt 0 ]; then
    echo ""
    echo -e "${RED}The following files failed validation:${NC}"
    for file in "${FAILED_FILES[@]}"; do
        echo -e "  ${RED}✗${NC} $file"
    done
    echo ""
    echo -e "${RED}Error: Content validation failed. The above files contain content not found in the original documentation.${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}✓ All files validated successfully!${NC}"
exit 0
