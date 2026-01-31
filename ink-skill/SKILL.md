---
name: ink-skill
description: Build CLI applications using React. Use when creating terminal UIs, handling keyboard input, or building interactive command-line tools with React components. Supports flexbox layouts, text styling, focus management, and accessibility.
---

# Ink - React for CLIs

> React for CLIs. Build and test your CLI output using components.

Ink provides the same component-based UI building experience that React offers in the browser, but for command-line apps. It uses [Yoga](https://github.com/facebook/yoga) for Flexbox layouts in the terminal.

**Important:** All text must be wrapped in a [`<Text>`](components/text.md) component.

## Quick Example

```jsx
import {render, Text, Box} from 'ink';

render(
	<Box borderStyle="round" padding={1}>
		<Text color="green">Hello World</Text>
	</Box>
);
```

## Components

- **[`<Text>`](components/text.md)** - Display text with styling (color, bold, italic, underline, etc.)
- **[`<Box>`](components/box-layout.md)** - Flexbox container for layouts
  - [Layout Properties](components/box-layout.md) - dimensions, flex, spacing, alignment
  - [Visual Properties](components/box-styling.md) - borders, colors, backgrounds
- **[`<Newline>`](components/spacer-newline.md)** - Insert newline characters
- **[`<Spacer>`](components/spacer-newline.md)** - Flexible space that expands to fill available space
- **[`<Static>`](components/static.md)** - Permanently render output above everything else (for logs, completed tasks)
- **[`<Transform>`](components/transform.md)** - Transform string representation before output

## Hooks

### Interaction
- **[`useInput()`](hooks/input.md)** - Handle keyboard input (arrow keys, enter, escape, etc.)
- **[`useFocus()`](hooks/focus.md)** - Make components focusable with Tab key
- **[`useFocusManager()`](hooks/focus.md)** - Programmatically manage focus

### Lifecycle & Streams
- **[`useApp()`](hooks/lifecycle.md)** - Exit the app programmatically
- **[`useStdin()`](hooks/input.md)** - Access stdin stream and setRawMode
- **[`useStdout()`](hooks/lifecycle.md)** - Access stdout stream and write output
- **[`useStderr()`](hooks/lifecycle.md)** - Access stderr stream

### Accessibility
- **[`useIsScreenReaderEnabled()`](hooks/screen-reader.md)** - Detect if screen reader is active

## API

- **[`render(tree, options?)`](api/render.md)** - Mount and render your app
- **[Instance Methods](api/instance.md)** - rerender(), unmount(), waitUntilExit(), clear()
- **[`measureElement(ref)`](api/measure.md)** - Get width and height of a component

## Guides

- **[Accessibility & Screen Readers](guides/accessibility.md)** - ARIA support, screen reader integration
- **[Testing](guides/testing.md)** - Test Ink components with ink-testing-library
- **[React DevTools](guides/devtools.md)** - Debug with React DevTools

## Third-Party Components

See **[components/third-party.md](components/third-party.md)** for a comprehensive list of community components including:
- Text inputs, spinners, select menus
- Progress bars, tables, charts
- Markdown rendering, syntax highlighting
- And many more
