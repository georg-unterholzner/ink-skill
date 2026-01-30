# Ink - React for CLIs

Complete reference documentation for Ink. This file is auto-generated from individual skill files.

---

## Main Documentation

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

---

## Components Reference

### box-layout

# `<Box>` - Layout Properties

`<Box>` is an essential Ink component to build your layout.
It's like `<div style="display: flex">` in the browser.

```jsx
import {render, Box, Text} from 'ink';

const Example = () => (
	<Box margin={2}>
		<Text>This is a box with margin</Text>
	</Box>
);

render(<Example />);
```

This document covers layout-related properties. For borders and colors, see [box-styling.md](box-styling.md).

## Dimensions

### width

Type: `number` `string`

Width of the element in spaces.
You can also set it as a percentage, which will calculate the width based on the width of the parent element.

```jsx
<Box width={4}>
	<Text>X</Text>
</Box>
//=> 'X   '
```

```jsx
<Box width={10}>
	<Box width="50%">
		<Text>X</Text>
	</Box>
	<Text>Y</Text>
</Box>
//=> 'X    Y'
```

### height

Type: `number` `string`

Height of the element in lines (rows).
You can also set it as a percentage, which will calculate the height based on the height of the parent element.

```jsx
<Box height={4}>
	<Text>X</Text>
</Box>
//=> 'X\n\n\n'
```

```jsx
<Box height={6} flexDirection="column">
	<Box height="50%">
		<Text>X</Text>
	</Box>
	<Text>Y</Text>
</Box>
//=> 'X\n\n\nY\n\n'
```

### minWidth

Type: `number`

Sets a minimum width of the element.
Percentages aren't supported yet; see https://github.com/facebook/yoga/issues/872.

### minHeight

Type: `number`

Sets a minimum height of the element.
Percentages aren't supported yet; see https://github.com/facebook/yoga/issues/872.

## Padding

### paddingTop

Type: `number`\
Default: `0`

Top padding.

### paddingBottom

Type: `number`\
Default: `0`

Bottom padding.

### paddingLeft

Type: `number`\
Default: `0`

Left padding.

### paddingRight

Type: `number`\
Default: `0`

Right padding.

### paddingX

Type: `number`\
Default: `0`

Horizontal padding. Equivalent to setting `paddingLeft` and `paddingRight`.

### paddingY

Type: `number`\
Default: `0`

Vertical padding. Equivalent to setting `paddingTop` and `paddingBottom`.

### padding

Type: `number`\
Default: `0`

Padding on all sides. Equivalent to setting `paddingTop`, `paddingBottom`, `paddingLeft` and `paddingRight`.

```jsx
<Box paddingTop={2}><Text>Top</Text></Box>
<Box paddingBottom={2}><Text>Bottom</Text></Box>
<Box paddingLeft={2}><Text>Left</Text></Box>
<Box paddingRight={2}><Text>Right</Text></Box>
<Box paddingX={2}><Text>Left and right</Text></Box>
<Box paddingY={2}><Text>Top and bottom</Text></Box>
<Box padding={2}><Text>Top, bottom, left and right</Text></Box>
```

## Margin

### marginTop

Type: `number`\
Default: `0`

Top margin.

### marginBottom

Type: `number`\
Default: `0`

Bottom margin.

### marginLeft

Type: `number`\
Default: `0`

Left margin.

### marginRight

Type: `number`\
Default: `0`

Right margin.

### marginX

Type: `number`\
Default: `0`

Horizontal margin. Equivalent to setting `marginLeft` and `marginRight`.

### marginY

Type: `number`\
Default: `0`

Vertical margin. Equivalent to setting `marginTop` and `marginBottom`.

### margin

Type: `number`\
Default: `0`

Margin on all sides. Equivalent to setting `marginTop`, `marginBottom`, `marginLeft` and `marginRight`.

```jsx
<Box marginTop={2}><Text>Top</Text></Box>
<Box marginBottom={2}><Text>Bottom</Text></Box>
<Box marginLeft={2}><Text>Left</Text></Box>
<Box marginRight={2}><Text>Right</Text></Box>
<Box marginX={2}><Text>Left and right</Text></Box>
<Box marginY={2}><Text>Top and bottom</Text></Box>
<Box margin={2}><Text>Top, bottom, left and right</Text></Box>
```

## Gap

### gap

Type: `number`\
Default: `0`

Size of the gap between an element's columns and rows. A shorthand for `columnGap` and `rowGap`.

```jsx
<Box gap={1} width={3} flexWrap="wrap">
	<Text>A</Text>
	<Text>B</Text>
	<Text>C</Text>
</Box>
// A B
//
// C
```

### columnGap

Type: `number`\
Default: `0`

Size of the gap between an element's columns.

```jsx
<Box columnGap={1}>
	<Text>A</Text>
	<Text>B</Text>
</Box>
// A B
```

### rowGap

Type: `number`\
Default: `0`

Size of the gap between an element's rows.

```jsx
<Box flexDirection="column" rowGap={1}>
	<Text>A</Text>
	<Text>B</Text>
</Box>
// A
//
// B
```

## Flex

### flexGrow

Type: `number`\
Default: `0`

See [flex-grow](https://css-tricks.com/almanac/properties/f/flex-grow/).

```jsx
<Box>
	<Text>Label:</Text>
	<Box flexGrow={1}>
		<Text>Fills all remaining space</Text>
	</Box>
</Box>
```

### flexShrink

Type: `number`\
Default: `1`

See [flex-shrink](https://css-tricks.com/almanac/properties/f/flex-shrink/).

```jsx
<Box width={20}>
	<Box flexShrink={2} width={10}>
		<Text>Will be 1/4</Text>
	</Box>
	<Box width={10}>
		<Text>Will be 3/4</Text>
	</Box>
</Box>
```

### flexBasis

Type: `number` `string`

See [flex-basis](https://css-tricks.com/almanac/properties/f/flex-basis/).

```jsx
<Box width={6}>
	<Box flexBasis={3}>
		<Text>X</Text>
	</Box>
	<Text>Y</Text>
</Box>
//=> 'X  Y'
```

```jsx
<Box width={6}>
	<Box flexBasis="50%">
		<Text>X</Text>
	</Box>
	<Text>Y</Text>
</Box>
//=> 'X  Y'
```

### flexDirection

Type: `string`\
Allowed values: `row` `row-reverse` `column` `column-reverse`

See [flex-direction](https://css-tricks.com/almanac/properties/f/flex-direction/).

```jsx
<Box>
	<Box marginRight={1}>
		<Text>X</Text>
	</Box>
	<Text>Y</Text>
</Box>
// X Y

<Box flexDirection="row-reverse">
	<Text>X</Text>
	<Box marginRight={1}>
		<Text>Y</Text>
	</Box>
</Box>
// Y X

<Box flexDirection="column">
	<Text>X</Text>
	<Text>Y</Text>
</Box>
// X
// Y

<Box flexDirection="column-reverse">
	<Text>X</Text>
	<Text>Y</Text>
</Box>
// Y
// X
```

### flexWrap

Type: `string`\
Allowed values: `nowrap` `wrap` `wrap-reverse`

See [flex-wrap](https://css-tricks.com/almanac/properties/f/flex-wrap/).

```jsx
<Box width={2} flexWrap="wrap">
	<Text>A</Text>
	<Text>BC</Text>
</Box>
// A
// B C
```

```jsx
<Box flexDirection="column" height={2} flexWrap="wrap">
	<Text>A</Text>
	<Text>B</Text>
	<Text>C</Text>
</Box>
// A C
// B
```

### alignItems

Type: `string`\
Allowed values: `flex-start` `center` `flex-end`

See [align-items](https://css-tricks.com/almanac/properties/a/align-items/).

```jsx
<Box alignItems="flex-start">
	<Box marginRight={1}>
		<Text>X</Text>
	</Box>
	<Text>
		A
		<Newline/>
		B
		<Newline/>
		C
	</Text>
</Box>
// X A
//   B
//   C

<Box alignItems="center">
	<Box marginRight={1}>
		<Text>X</Text>
	</Box>
	<Text>
		A
		<Newline/>
		B
		<Newline/>
		C
	</Text>
</Box>
//   A
// X B
//   C

<Box alignItems="flex-end">
	<Box marginRight={1}>
		<Text>X</Text>
	</Box>
	<Text>
		A
		<Newline/>
		B
		<Newline/>
		C
	</Text>
</Box>
//   A
//   B
// X C
```

### alignSelf

Type: `string`\
Default: `auto`\
Allowed values: `auto` `flex-start` `center` `flex-end`

See [align-self](https://css-tricks.com/almanac/properties/a/align-self/).

```jsx
<Box height={3}>
	<Box alignSelf="flex-start">
		<Text>X</Text>
	</Box>
</Box>
// X
//
//

<Box height={3}>
	<Box alignSelf="center">
		<Text>X</Text>
	</Box>
</Box>
//
// X
//

<Box height={3}>
	<Box alignSelf="flex-end">
		<Text>X</Text>
	</Box>
</Box>
//
//
// X
```

### justifyContent

Type: `string`\
Allowed values: `flex-start` `center` `flex-end` `space-between` `space-around` `space-evenly`

See [justify-content](https://css-tricks.com/almanac/properties/j/justify-content/).

```jsx
<Box justifyContent="flex-start">
	<Text>X</Text>
</Box>
// [X      ]

<Box justifyContent="center">
	<Text>X</Text>
</Box>
// [   X   ]

<Box justifyContent="flex-end">
	<Text>X</Text>
</Box>
// [      X]

<Box justifyContent="space-between">
	<Text>X</Text>
	<Text>Y</Text>
</Box>
// [X      Y]

<Box justifyContent="space-around">
	<Text>X</Text>
	<Text>Y</Text>
</Box>
// [  X   Y  ]

<Box justifyContent="space-evenly">
	<Text>X</Text>
	<Text>Y</Text>
</Box>
// [   X   Y   ]
```

## Visibility

### display

Type: `string`\
Allowed values: `flex` `none`\
Default: `flex`

Set this property to `none` to hide the element.

### overflowX

Type: `string`\
Allowed values: `visible` `hidden`\
Default: `visible`

Behavior for an element's overflow in the horizontal direction.

### overflowY

Type: `string`\
Allowed values: `visible` `hidden`\
Default: `visible`

Behavior for an element's overflow in the vertical direction.

### overflow

Type: `string`\
Allowed values: `visible` `hidden`\
Default: `visible`

A shortcut for setting `overflowX` and `overflowY` at the same time.

---

### box-styling

# `<Box>` - Visual Properties

This document covers visual styling properties for the `<Box>` component (borders, colors, backgrounds).
For layout properties (dimensions, flex, spacing), see [box-layout.md](box-layout.md).

## Borders

### borderStyle

Type: `string`\
Allowed values: `single` `double` `round` `bold` `singleDouble` `doubleSingle` `classic` | `BoxStyle`

Add a border with a specified style.
If `borderStyle` is `undefined` (the default), no border will be added.
Ink uses border styles from the [`cli-boxes`](https://github.com/sindresorhus/cli-boxes) module.

```jsx
<Box flexDirection="column">
	<Box>
		<Box borderStyle="single" marginRight={2}>
			<Text>single</Text>
		</Box>

		<Box borderStyle="double" marginRight={2}>
			<Text>double</Text>
		</Box>

		<Box borderStyle="round" marginRight={2}>
			<Text>round</Text>
		</Box>

		<Box borderStyle="bold">
			<Text>bold</Text>
		</Box>
	</Box>

	<Box marginTop={1}>
		<Box borderStyle="singleDouble" marginRight={2}>
			<Text>singleDouble</Text>
		</Box>

		<Box borderStyle="doubleSingle" marginRight={2}>
			<Text>doubleSingle</Text>
		</Box>

		<Box borderStyle="classic">
			<Text>classic</Text>
		</Box>
	</Box>
</Box>
```

Alternatively, pass a custom border style like so:

```jsx
<Box
	borderStyle={{
		topLeft: '↘',
		top: '↓',
		topRight: '↙',
		left: '→',
		bottomLeft: '↗',
		bottom: '↑',
		bottomRight: '↖',
		right: '←'
	}}
>
	<Text>Custom</Text>
</Box>
```

### borderColor

Type: `string`

Change border color.
A shorthand for setting `borderTopColor`, `borderRightColor`, `borderBottomColor`, and `borderLeftColor`.

```jsx
<Box borderStyle="round" borderColor="green">
	<Text>Green Rounded Box</Text>
</Box>
```

### borderTopColor

Type: `string`

Change top border color.
Accepts the same values as [`color`](text.md#color) in `<Text>` component.

```jsx
<Box borderStyle="round" borderTopColor="green">
	<Text>Hello world</Text>
</Box>
```

### borderRightColor

Type: `string`

Change the right border color.
Accepts the same values as [`color`](text.md#color) in `<Text>` component.

```jsx
<Box borderStyle="round" borderRightColor="green">
	<Text>Hello world</Text>
</Box>
```

### borderBottomColor

Type: `string`

Change the bottom border color.
Accepts the same values as [`color`](text.md#color) in `<Text>` component.

```jsx
<Box borderStyle="round" borderBottomColor="green">
	<Text>Hello world</Text>
</Box>
```

### borderLeftColor

Type: `string`

Change the left border color.
Accepts the same values as [`color`](text.md#color) in `<Text>` component.

```jsx
<Box borderStyle="round" borderLeftColor="green">
	<Text>Hello world</Text>
</Box>
```

### borderDimColor

Type: `boolean`\
Default: `false`

Dim the border color.
A shorthand for setting `borderTopDimColor`, `borderBottomDimColor`, `borderLeftDimColor`, and `borderRightDimColor`.

```jsx
<Box borderStyle="round" borderDimColor>
	<Text>Hello world</Text>
</Box>
```

### borderTopDimColor

Type: `boolean`\
Default: `false`

Dim the top border color.

```jsx
<Box borderStyle="round" borderTopDimColor>
	<Text>Hello world</Text>
</Box>
```

### borderBottomDimColor

Type: `boolean`\
Default: `false`

Dim the bottom border color.

```jsx
<Box borderStyle="round" borderBottomDimColor>
	<Text>Hello world</Text>
</Box>
```

### borderLeftDimColor

Type: `boolean`\
Default: `false`

Dim the left border color.

```jsx
<Box borderStyle="round" borderLeftDimColor>
	<Text>Hello world</Text>
</Box>
```

### borderRightDimColor

Type: `boolean`\
Default: `false`

Dim the right border color.

```jsx
<Box borderStyle="round" borderRightDimColor>
	<Text>Hello world</Text>
</Box>
```

### borderTop

Type: `boolean`\
Default: `true`

Determines whether the top border is visible.

### borderRight

Type: `boolean`\
Default: `true`

Determines whether the right border is visible.

### borderBottom

Type: `boolean`\
Default: `true`

Determines whether the bottom border is visible.

### borderLeft

Type: `boolean`\
Default: `true`

Determines whether the left border is visible.

## Background

### backgroundColor

Type: `string`

Background color for the element.

Accepts the same values as [`color`](text.md#color) in the `<Text>` component.

```jsx
<Box flexDirection="column">
	<Box backgroundColor="red" width={20} height={5} alignSelf="flex-start">
		<Text>Red background</Text>
	</Box>

	<Box backgroundColor="#FF8800" width={20} height={3} marginTop={1} alignSelf="flex-start">
		<Text>Orange background</Text>
	</Box>

	<Box backgroundColor="rgb(0, 255, 0)" width={20} height={3} marginTop={1} alignSelf="flex-start">
		<Text>Green background</Text>
	</Box>
</Box>
```

The background color fills the entire `<Box>` area and is inherited by child `<Text>` components unless they specify their own `backgroundColor`.

```jsx
<Box backgroundColor="blue" alignSelf="flex-start">
	<Text>Blue inherited </Text>
	<Text backgroundColor="yellow">Yellow override </Text>
	<Text>Blue inherited again</Text>
</Box>
```

Background colors work with borders and padding:

```jsx
<Box backgroundColor="cyan" borderStyle="round" padding={1} alignSelf="flex-start">
	<Text>Background with border and padding</Text>
</Box>
```

---

### spacer-newline

# `<Newline>` and `<Spacer>`

## `<Newline>`

Adds one or more newline (`\n`) characters.
Must be used within `<Text>` components.

### count

Type: `number`\
Default: `1`

Number of newlines to insert.

```jsx
import {render, Text, Newline} from 'ink';

const Example = () => (
	<Text>
		<Text color="green">Hello</Text>
		<Newline />
		<Text color="red">World</Text>
	</Text>
);

render(<Example />);
```

Output:

```
Hello
World
```

## `<Spacer>`

A flexible space that expands along the major axis of its containing layout.
It's useful as a shortcut for filling all the available space between elements.

For example, using `<Spacer>` in a `<Box>` with default flex direction (`row`) will position "Left" on the left side and will push "Right" to the right side.

```jsx
import {render, Box, Text, Spacer} from 'ink';

const Example = () => (
	<Box>
		<Text>Left</Text>
		<Spacer />
		<Text>Right</Text>
	</Box>
);

render(<Example />);
```

In a vertical flex direction (`column`), it will position "Top" at the top of the container and push "Bottom" to the bottom.
Note that the container needs to be tall enough to see this in effect.

```jsx
import {render, Box, Text, Spacer} from 'ink';

const Example = () => (
	<Box flexDirection="column" height={10}>
		<Text>Top</Text>
		<Spacer />
		<Text>Bottom</Text>
	</Box>
);

render(<Example />);
```

---

### static

# `<Static>`

`<Static>` component permanently renders its output above everything else.
It's useful for displaying activity like completed tasks or logs - things that
don't change after they're rendered (hence the name "Static").

It's preferred to use `<Static>` for use cases like these when you can't know
or control the number of items that need to be rendered.

For example, [Tap](https://github.com/tapjs/node-tap) uses `<Static>` to display
a list of completed tests. [Gatsby](https://github.com/gatsbyjs/gatsby) uses it
to display a list of generated pages while still displaying a live progress bar.

```jsx
import React, {useState, useEffect} from 'react';
import {render, Static, Box, Text} from 'ink';

const Example = () => {
	const [tests, setTests] = useState([]);

	useEffect(() => {
		let completedTests = 0;
		let timer;

		const run = () => {
			// Fake 10 completed tests
			if (completedTests++ < 10) {
				setTests(previousTests => [
					...previousTests,
					{
						id: previousTests.length,
						title: `Test #${previousTests.length + 1}`
					}
				]);

				timer = setTimeout(run, 100);
			}
		};

		run();

		return () => {
			clearTimeout(timer);
		};
	}, []);

	return (
		<>
			{/* This part will be rendered once to the terminal */}
			<Static items={tests}>
				{test => (
					<Box key={test.id}>
						<Text color="green">✔ {test.title}</Text>
					</Box>
				)}
			</Static>

			{/* This part keeps updating as state changes */}
			<Box marginTop={1}>
				<Text dimColor>Completed tests: {tests.length}</Text>
			</Box>
		</>
	);
};

render(<Example />);
```

**Note:** `<Static>` only renders new items in the `items` prop and ignores items
that were previously rendered. This means that when you add new items to the `items`
array, changes you make to previous items will not trigger a rerender.

## items

Type: `Array`

Array of items of any type to render using the function you pass as a component child.

## style

Type: `object`

Styles to apply to a container of child elements.
See [`<Box>`](box-layout.md) for supported properties.

```jsx
<Static items={...} style={{padding: 1}}>
	{...}
</Static>
```

## children(item)

Type: `Function`

Function that is called to render every item in the `items` array.
The first argument is the item itself, and the second argument is the index of that item in the
`items` array.

Note that a `key` must be assigned to the root component.

```jsx
<Static items={['a', 'b', 'c']}>
	{(item, index) => {
		// This function is called for every item in ['a', 'b', 'c']
		// `item` is 'a', 'b', 'c'
		// `index` is 0, 1, 2
		return (
			<Box key={index}>
				<Text>Item: {item}</Text>
			</Box>
		);
	}}
</Static>
```

---

### text

# `<Text>`

This component can display text and change its style to make it bold, underlined, italic, or strikethrough.

```jsx
import {render, Text} from 'ink';

const Example = () => (
	<>
		<Text color="green">I am green</Text>
		<Text color="black" backgroundColor="white">
			I am black on white
		</Text>
		<Text color="#ffffff">I am white</Text>
		<Text bold>I am bold</Text>
		<Text italic>I am italic</Text>
		<Text underline>I am underline</Text>
		<Text strikethrough>I am strikethrough</Text>
		<Text inverse>I am inversed</Text>
	</>
);

render(<Example />);
```

**Note:** `<Text>` allows only text nodes and nested `<Text>` components inside of it. For example, `<Box>` component can't be used inside `<Text>`.

## color

Type: `string`

Change text color.
Ink uses [chalk](https://github.com/chalk/chalk) under the hood, so all its functionality is supported.

```jsx
<Text color="green">Green</Text>
<Text color="#005cc5">Blue</Text>
<Text color="rgb(232, 131, 136)">Red</Text>
```

## backgroundColor

Type: `string`

Same as `color` above, but for background.

```jsx
<Text backgroundColor="green" color="white">Green</Text>
<Text backgroundColor="#005cc5" color="white">Blue</Text>
<Text backgroundColor="rgb(232, 131, 136)" color="white">Red</Text>
```

## dimColor

Type: `boolean`\
Default: `false`

Dim the color (make it less bright).

```jsx
<Text color="red" dimColor>
	Dimmed Red
</Text>
```

## bold

Type: `boolean`\
Default: `false`

Make the text bold.

## italic

Type: `boolean`\
Default: `false`

Make the text italic.

## underline

Type: `boolean`\
Default: `false`

Make the text underlined.

## strikethrough

Type: `boolean`\
Default: `false`

Make the text crossed with a line.

## inverse

Type: `boolean`\
Default: `false`

Invert background and foreground colors.

```jsx
<Text inverse color="yellow">
	Inversed Yellow
</Text>
```

## wrap

Type: `string`\
Allowed values: `wrap` `truncate` `truncate-start` `truncate-middle` `truncate-end`\
Default: `wrap`

This property tells Ink to wrap or truncate text if its width is larger than the container.
If `wrap` is passed (the default), Ink will wrap text and split it into multiple lines.
If `truncate-*` is passed, Ink will truncate text instead, resulting in one line of text with the rest cut off.

```jsx
<Box width={7}>
	<Text>Hello World</Text>
</Box>
//=> 'Hello\nWorld'

// `truncate` is an alias to `truncate-end`
<Box width={7}>
	<Text wrap="truncate">Hello World</Text>
</Box>
//=> 'Hello…'

<Box width={7}>
	<Text wrap="truncate-middle">Hello World</Text>
</Box>
//=> 'He…ld'

<Box width={7}>
	<Text wrap="truncate-start">Hello World</Text>
</Box>
//=> '…World'
```

---

### third-party

# Useful Third-Party Components

## Input & Selection

- [ink-text-input](https://github.com/vadimdemedes/ink-text-input) - Text input.
- [ink-select-input](https://github.com/vadimdemedes/ink-select-input) - Select (dropdown) input.
- [ink-multi-select](https://github.com/karaggeorge/ink-multi-select) - Select one or more values from a list
- [ink-confirm-input](https://github.com/kevva/ink-confirm-input) - Yes/No confirmation input.
- [ink-quicksearch-input](https://github.com/Eximchain/ink-quicksearch-input) - Select component with fast, quicksearch-like navigation.
- [ink-form](https://github.com/lukasbach/ink-form) - Form.

## Display & Styling

- [ink-spinner](https://github.com/vadimdemedes/ink-spinner) - Spinner.
- [ink-link](https://github.com/sindresorhus/ink-link) - Link.
- [ink-gradient](https://github.com/sindresorhus/ink-gradient) - Gradient color.
- [ink-big-text](https://github.com/sindresorhus/ink-big-text) - Awesome text.
- [ink-ascii](https://github.com/hexrcs/ink-ascii) - Awesome text component with more font choices, based on Figlet.
- [ink-picture](https://github.com/endernoke/ink-picture) - Display images.
- [ink-color-pipe](https://github.com/LitoMore/ink-color-pipe) - Create color text with simpler style strings.
- [ink-divider](https://github.com/JureSotosek/ink-divider) - A divider.

## Layout & Tables

- [ink-tab](https://github.com/jdeniau/ink-tab) - Tab.
- [ink-table](https://github.com/maticzav/ink-table) - Table.
- [ink-titled-box](https://github.com/mishieck/ink-titled-box) - Box with a title.
- [ink-scroll-view](https://github.com/ByteLandTechnology/ink-scroll-view) - Scroll container.
- [ink-scroll-list](https://github.com/ByteLandTechnology/ink-scroll-list) - Scrollable list.
- [ink-virtual-list](https://github.com/archcorsair/ink-virtual-list) - Virtualized list that renders only visible items for performance.

## Progress & Charts

- [ink-progress-bar](https://github.com/brigand/ink-progress-bar) - Progress bar.
- [ink-chart](https://github.com/pppp606/ink-chart) - Sparkline and bar chart.
- [ink-task-list](https://github.com/privatenumber/ink-task-list) - Task list.

## Content Rendering

- [ink-markdown](https://github.com/cameronhunter/ink-markdown) - Render syntax highlighted Markdown.
- [ink-syntax-highlight](https://github.com/vsashyn/ink-syntax-highlight) - Code syntax highlighting.

## Process & System

- [ink-spawn](https://github.com/kraenhansen/ink-spawn) - Spawn child processes.
- [ink-stepper](https://github.com/archcorsair/ink-stepper) - Step-by-step wizard.

## Useful Hooks

- [ink-use-stdout-dimensions](https://github.com/cameronhunter/ink-monorepo/tree/master/packages/ink-use-stdout-dimensions) - Subscribe to stdout dimensions.

---

### transform

# `<Transform>`

Transform a string representation of React components before they're written to output.
For example, you might want to apply a [gradient to text](https://github.com/sindresorhus/ink-gradient), [add a clickable link](https://github.com/sindresorhus/ink-link), or [create some text effects](https://github.com/sindresorhus/ink-big-text).
These use cases can't accept React nodes as input; they expect a string.
That's what the `<Transform>` component does: it gives you an output string of its child components and lets you transform it in any way.

**Note:** `<Transform>` must be applied only to `<Text>` children components and shouldn't change the dimensions of the output; otherwise, the layout will be incorrect.

```jsx
import {render, Transform} from 'ink';

const Example = () => (
	<Transform transform={output => output.toUpperCase()}>
		<Text>Hello World</Text>
	</Transform>
);

render(<Example />);
```

Since the `transform` function converts all characters to uppercase, the final output rendered to the terminal will be "HELLO WORLD", not "Hello World".

When the output wraps to multiple lines, it can be helpful to know which line is being processed.

For example, to implement a hanging indent component, you can indent all the lines except for the first.

```jsx
import {render, Transform} from 'ink';

const HangingIndent = ({content, indent = 4, children, ...props}) => (
	<Transform
		transform={(line, index) =>
			index === 0 ? line : ' '.repeat(indent) + line
		}
		{...props}
	>
		{children}
	</Transform>
);

const text =
	'WHEN I WROTE the following pages, or rather the bulk of them, ' +
	'I lived alone, in the woods, a mile from any neighbor, in a ' +
	'house which I had built myself, on the shore of Walden Pond, ' +
	'in Concord, Massachusetts, and earned my living by the labor ' +
	'of my hands only. I lived there two years and two months. At ' +
	'present I am a sojourner in civilized life again.';

// Other text properties are allowed as well
render(
	<HangingIndent bold dimColor indent={4}>
		{text}
	</HangingIndent>
);
```

## transform(outputLine, index)

Type: `Function`

Function that transforms children output.
It accepts children and must return transformed children as well.

### children

Type: `string`

Output of child components.

### index

Type: `number`

The zero-indexed line number of the line that's currently being transformed.

---

## Hooks Reference

### focus

# Focus Hooks

## useFocus(options?)

A component that uses the `useFocus` hook becomes "focusable" to Ink, so when the user presses <kbd>Tab</kbd>, Ink will switch focus to this component.
If there are multiple components that execute the `useFocus` hook, focus will be given to them in the order in which these components are rendered.
This hook returns an object with an `isFocused` boolean property, which determines whether this component is focused.

### options

#### autoFocus

Type: `boolean`\
Default: `false`

Auto-focus this component if there's no active (focused) component right now.

#### isActive

Type: `boolean`\
Default: `true`

Enable or disable this component's focus, while still maintaining its position in the list of focusable components.
This is useful for inputs that are temporarily disabled.

#### id

Type: `string`\
Required: `false`

Set a component's focus ID, which can be used to programmatically focus the component. This is useful for large interfaces with many focusable elements to avoid having to cycle through all of them.

```jsx
import {render, useFocus, Text} from 'ink';

const Example = () => {
	const {isFocused} = useFocus();

	return <Text>{isFocused ? 'I am focused' : 'I am not focused'}</Text>;
};

render(<Example />);
```

## useFocusManager()

This hook exposes methods to enable or disable focus management for all components or manually switch focus to the next or previous components.

### enableFocus()

Enable focus management for all components.

**Note:** You don't need to call this method manually unless you've disabled focus management. Focus management is enabled by default.

```js
import {useFocusManager} from 'ink';

const Example = () => {
	const {enableFocus} = useFocusManager();

	useEffect(() => {
		enableFocus();
	}, []);

	return …
};
```

### disableFocus()

Disable focus management for all components.
The currently active component (if there's one) will lose its focus.

```js
import {useFocusManager} from 'ink';

const Example = () => {
	const {disableFocus} = useFocusManager();

	useEffect(() => {
		disableFocus();
	}, []);

	return …
};
```

### focusNext()

Switch focus to the next focusable component.
If there's no active component right now, focus will be given to the first focusable component.
If the active component is the last in the list of focusable components, focus will be switched to the first focusable component.

**Note:** Ink calls this method when user presses <kbd>Tab</kbd>.

```js
import {useFocusManager} from 'ink';

const Example = () => {
	const {focusNext} = useFocusManager();

	useEffect(() => {
		focusNext();
	}, []);

	return …
};
```

### focusPrevious()

Switch focus to the previous focusable component.
If there's no active component right now, focus will be given to the first focusable component.
If the active component is the first in the list of focusable components, focus will be switched to the last focusable component.

**Note:** Ink calls this method when user presses <kbd>Shift</kbd>+<kbd>Tab</kbd>.

```js
import {useFocusManager} from 'ink';

const Example = () => {
	const {focusPrevious} = useFocusManager();

	useEffect(() => {
		focusPrevious();
	}, []);

	return …
};
```

### focus(id)

#### id

Type: `string`

Switch focus to the component with the given [`id`](#id).
If there's no component with that ID, focus will be given to the next focusable component.

```js
import {useFocusManager, useInput} from 'ink';

const Example = () => {
	const {focus} = useFocusManager();

	useInput(input => {
		if (input === 's') {
			// Focus the component with focus ID 'someId'
			focus('someId');
		}
	});

	return …
};
```

---

### input

# Input Hooks

## useInput(inputHandler, options?)

This hook is used for handling user input.
It's a more convenient alternative to using `useStdin` and listening for `data` events.
The callback you pass to `useInput` is called for each character when the user enters any input.
However, if the user pastes text and it's more than one character, the callback will be called only once, and the whole string will be passed as `input`.

```jsx
import {useInput} from 'ink';

const UserInput = () => {
	useInput((input, key) => {
		if (input === 'q') {
			// Exit program
		}

		if (key.leftArrow) {
			// Left arrow key pressed
		}
	});

	return …
};
```

### inputHandler(input, key)

Type: `Function`

The handler function that you pass to `useInput` receives two arguments:

#### input

Type: `string`

The input that the program received.

#### key

Type: `object`

Handy information about a key that was pressed.

##### key.leftArrow

##### key.rightArrow

##### key.upArrow

##### key.downArrow

Type: `boolean`\
Default: `false`

If an arrow key was pressed, the corresponding property will be `true`.
For example, if the user presses the left arrow key, `key.leftArrow` equals `true`.

##### key.return

Type: `boolean`\
Default: `false`

Return (Enter) key was pressed.

##### key.escape

Type: `boolean`\
Default: `false`

Escape key was pressed.

##### key.ctrl

Type: `boolean`\
Default: `false`

Ctrl key was pressed.

##### key.shift

Type: `boolean`\
Default: `false`

Shift key was pressed.

##### key.tab

Type: `boolean`\
Default: `false`

Tab key was pressed.

##### key.backspace

Type: `boolean`\
Default: `false`

Backspace key was pressed.

##### key.delete

Type: `boolean`\
Default: `false`

Delete key was pressed.

##### key.pageDown

##### key.pageUp

Type: `boolean`\
Default: `false`

If the Page Up or Page Down key was pressed, the corresponding property will be `true`.
For example, if the user presses Page Down, `key.pageDown` equals `true`.

##### key.meta

Type: `boolean`\
Default: `false`

[Meta key](https://en.wikipedia.org/wiki/Meta_key) was pressed.

### options

Type: `object`

#### isActive

Type: `boolean`\
Default: `true`

Enable or disable capturing of user input.
Useful when there are multiple `useInput` hooks used at once to avoid handling the same input several times.

## useStdin()

`useStdin` is a React hook that exposes the stdin stream.

### stdin

Type: `stream.Readable`\
Default: `process.stdin`

The stdin stream passed to `render()` in `options.stdin`, or `process.stdin` by default.
Useful if your app needs to handle user input.

```js
import {useStdin} from 'ink';

const Example = () => {
	const {stdin} = useStdin();

	return …
};
```

### isRawModeSupported

Type: `boolean`

A boolean flag determining if the current `stdin` supports `setRawMode`.
A component using `setRawMode` might want to use `isRawModeSupported` to nicely fall back in environments where raw mode is not supported.

```jsx
import {useStdin} from 'ink';

const Example = () => {
	const {isRawModeSupported} = useStdin();

	return isRawModeSupported ? (
		<MyInputComponent />
	) : (
		<MyComponentThatDoesntUseInput />
	);
};
```

### setRawMode(isRawModeEnabled)

Type: `function`

#### isRawModeEnabled

Type: `boolean`

See [`setRawMode`](https://nodejs.org/api/tty.html#tty_readstream_setrawmode_mode).
Ink exposes this function to be able to handle <kbd>Ctrl</kbd>+<kbd>C</kbd>, that's why you should use Ink's `setRawMode` instead of `process.stdin.setRawMode`.

**Warning:** This function will throw unless the current `stdin` supports `setRawMode`. Use [`isRawModeSupported`](#israwmodesupported) to detect `setRawMode` support.

```js
import {useStdin} from 'ink';

const Example = () => {
	const {setRawMode} = useStdin();

	useEffect(() => {
		setRawMode(true);

		return () => {
			setRawMode(false);
		};
	});

	return …
};
```

---

### lifecycle

# Lifecycle and Stream Hooks

## useApp()

`useApp` is a React hook that exposes a method to manually exit the app (unmount).

### exit(error?)

Type: `Function`

Exit (unmount) the whole Ink app.

#### error

Type: `Error`

Optional error. If passed, [`waitUntilExit`](../api/instance.md#waituntilexit) will reject with that error.

```js
import {useApp} from 'ink';

const Example = () => {
	const {exit} = useApp();

	// Exit the app after 5 seconds
	useEffect(() => {
		setTimeout(() => {
			exit();
		}, 5000);
	}, []);

	return …
};
```

## useStdout()

`useStdout` is a React hook that exposes the stdout stream where Ink renders your app.

### stdout

Type: `stream.Writable`\
Default: `process.stdout`

```js
import {useStdout} from 'ink';

const Example = () => {
	const {stdout} = useStdout();

	return …
};
```

### write(data)

Write any string to stdout while preserving Ink's output.
It's useful when you want to display external information outside of Ink's rendering and ensure there's no conflict between the two.
It's similar to `<Static>`, except it can't accept components; it only works with strings.

#### data

Type: `string`

Data to write to stdout.

```js
import {useStdout} from 'ink';

const Example = () => {
	const {write} = useStdout();

	useEffect(() => {
		// Write a single message to stdout, above Ink's output
		write('Hello from Ink to stdout\n');
	}, []);

	return …
};
```

## useStderr()

`useStderr` is a React hook that exposes the stderr stream.

### stderr

Type: `stream.Writable`\
Default: `process.stderr`

Stderr stream.

```js
import {useStderr} from 'ink';

const Example = () => {
	const {stderr} = useStderr();

	return …
};
```

### write(data)

Write any string to stderr while preserving Ink's output.

It's useful when you want to display external information outside of Ink's rendering and ensure there's no conflict between the two.
It's similar to `<Static>`, except it can't accept components; it only works with strings.

#### data

Type: `string`

Data to write to stderr.

```js
import {useStderr} from 'ink';

const Example = () => {
	const {write} = useStderr();

	useEffect(() => {
		// Write a single message to stderr, above Ink's output
		write('Hello from Ink to stderr\n');
	}, []);

	return …
};
```

---

### screen-reader

# Screen Reader Hook

## useIsScreenReaderEnabled()

Returns whether a screen reader is enabled. This is useful when you want to render different output for screen readers.

```jsx
import {useIsScreenReaderEnabled, Text} from 'ink';

const Example = () => {
	const isScreenReaderEnabled = useIsScreenReaderEnabled();

	return (
		<Text>
			{isScreenReaderEnabled
				? 'Screen reader is enabled'
				: 'Screen reader is disabled'}
		</Text>
	);
};
```

For more information on screen reader support, see [guides/accessibility.md](../guides/accessibility.md).

---

## API Reference

### instance

# Instance

This is the object that [`render()`](render.md) returns.

## rerender(tree)

Replace the previous root node with a new one or update the props of the current root node.

### tree

Type: `ReactElement`

```jsx
// Update props of the root node
const {rerender} = render(<Counter count={1} />);
rerender(<Counter count={2} />);

// Replace root node
const {rerender} = render(<OldCounter />);
rerender(<NewCounter />);
```

## unmount()

Manually unmount the whole Ink app.

```jsx
const {unmount} = render(<MyApp />);
unmount();
```

## waitUntilExit()

Returns a promise that resolves when the app is unmounted.

```jsx
const {unmount, waitUntilExit} = render(<MyApp />);

setTimeout(unmount, 1000);

await waitUntilExit(); // resolves after `unmount()` is called
```

## clear()

Clear output.

```jsx
const {clear} = render(<MyApp />);
clear();
```

---

### measure

# measureElement(ref)

Measure the dimensions of a particular `<Box>` element.
Returns an object with `width` and `height` properties.
This function is useful when your component needs to know the amount of available space it has. You can use it when you need to change the layout based on the length of its content.

**Note:** `measureElement()` returns correct results only after the initial render, when the layout has been calculated. Until then, `width` and `height` equal zero. It's recommended to call `measureElement()` in a `useEffect` hook, which fires after the component has rendered.

## ref

Type: `MutableRef`

A reference to a `<Box>` element captured with the `ref` property.
See [Refs](https://reactjs.org/docs/refs-and-the-dom.html) for more information on how to capture references.

```jsx
import {render, measureElement, Box, Text} from 'ink';

const Example = () => {
	const ref = useRef();

	useEffect(() => {
		const {width, height} = measureElement(ref.current);
		// width = 100, height = 1
	}, []);

	return (
		<Box width={100}>
			<Box ref={ref}>
				<Text>This box will stretch to 100 width</Text>
			</Box>
		</Box>
	);
};

render(<Example />);
```

---

### render

# render(tree, options?)

Returns: [`Instance`](instance.md)

Mount a component and render the output.

## tree

Type: `ReactElement`

## options

Type: `object`

### stdout

Type: `stream.Writable`\
Default: `process.stdout`

Output stream where the app will be rendered.

### stdin

Type: `stream.Readable`\
Default: `process.stdin`

Input stream where app will listen for input.

### stderr

Type: `stream.Writable`\
Default: `process.stderr`

Error stream.

### exitOnCtrlC

Type: `boolean`\
Default: `true`

Configure whether Ink should listen for Ctrl+C keyboard input and exit the app.
This is needed in case `process.stdin` is in [raw mode](https://nodejs.org/api/tty.html#tty_readstream_setrawmode_mode), because then Ctrl+C is ignored by default and the process is expected to handle it manually.

### patchConsole

Type: `boolean`\
Default: `true`

Patch console methods to ensure console output doesn't mix with Ink's output.
When any of the `console.*` methods are called (like `console.log()`), Ink intercepts their output, clears the main output, renders output from the console method, and then rerenders the main output again.
That way, both are visible and don't overlap each other.

This functionality is powered by [patch-console](https://github.com/vadimdemedes/patch-console), so if you need to disable Ink's interception of output but want to build something custom, you can use that.

### onRender

Type: `({renderTime: number}) => void`\
Default: `undefined`

Runs the given callback after each render and re-render with a metrics object.

### debug

Type: `boolean`\
Default: `false`

If `true`, each update will be rendered as separate output, without replacing the previous one.

### maxFps

Type: `number`\
Default: `30`

Maximum frames per second for render updates.
This controls how frequently the UI can update to prevent excessive re-rendering.
Higher values allow more frequent updates but may impact performance.
Setting it to a lower value may be useful for components that update very frequently, to reduce CPU usage.

### incrementalRendering

Type: `boolean`\
Default: `false`

Enable incremental rendering mode which only updates changed lines instead of redrawing the entire output.
This can reduce flickering and improve performance for frequently updating UIs.

### isScreenReaderEnabled

Type: `boolean`\
Default: `false`

Enable screen reader support. See [guides/accessibility.md](../guides/accessibility.md) for more information.

## Example

```jsx
import {render} from 'ink';

const instance = render(<MyApp />, {
	stdout: process.stdout,
	stdin: process.stdin,
	exitOnCtrlC: true,
	patchConsole: true,
	debug: false
});
```

---

## Guides

### accessibility

# Screen Reader Support

Ink has basic support for screen readers.

To enable it, you can either pass the `isScreenReaderEnabled` option to the `render` function or set the `INK_SCREEN_READER` environment variable to `true`.

Ink implements a small subset of functionality from the [ARIA specification](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA).

```jsx
render(<MyApp />, {isScreenReaderEnabled: true});
```

When screen reader support is enabled, Ink will try its best to generate a screen-reader-friendly output.

For example, for this code:

```jsx
<Box aria-role="checkbox" aria-state={{checked: true}}>
	<Text>Accept terms and conditions</Text>
</Box>
```

Ink will generate the following output for screen readers:

```
(checked) checkbox: Accept terms and conditions
```

You can also provide a custom label for screen readers if you want to render something different for them.

For example, if you are building a progress bar, you can use `aria-label` to provide a more descriptive label for screen readers.

```jsx
<Box>
	<Box width="50%" height={1} backgroundColor="green" />
	<Text aria-label="Progress: 50%">50%</Text>
</Box>
```

In the example above, the screen reader will read "Progress: 50%" instead of "50%".

## `aria-label`

Type: `string`

A label for the element for screen readers.

## `aria-hidden`

Type: `boolean`\
Default: `false`

Hide the element from screen readers.

## aria-role

Type: `string`

The role of the element.

Supported values:
- `button`
- `checkbox`
- `radio`
- `radiogroup`
- `list`
- `listitem`
- `menu`
- `menuitem`
- `progressbar`
- `tab`
- `tablist`
- `timer`
- `toolbar`
- `table`

## aria-state

Type: `object`

The state of the element.

Supported values:
- `checked` (boolean)
- `disabled` (boolean)
- `expanded` (boolean)
- `selected` (boolean)

## Creating Accessible Components

When building custom components, it's important to keep accessibility in mind. While Ink provides the building blocks, ensuring your components are accessible will make your CLIs usable by a wider audience.

### General Principles

- **Provide screen reader-friendly output:** Use the `useIsScreenReaderEnabled` hook to detect if a screen reader is active. You can then render more descriptive output for screen reader users.
- **Leverage ARIA props:** For components that have a specific role (e.g., a checkbox or button), use the `aria-role`, `aria-state`, and `aria-label` props on `<Box>` and `<Text>` to provide semantic meaning to screen readers.

---

### devtools

# Using React Devtools

Ink supports [React Devtools](https://github.com/facebook/react/tree/master/packages/react-devtools) out of the box. To enable integration with React Devtools in your Ink-based CLI, first ensure you have installed the optional `react-devtools-core` dependency, and then run your app with the `DEV=true` environment variable:

```sh
DEV=true my-cli
```

Then, start React Devtools itself:

```sh
npx react-devtools
```

After it starts, you should see the component tree of your CLI.
You can even inspect and change the props of components, and see the results immediately in the CLI, without restarting it.

**Note**: You must manually quit your CLI via <kbd>Ctrl</kbd>+<kbd>C</kbd> after you're done testing.

---

### testing

# Testing

Ink components are simple to test with [ink-testing-library](https://github.com/vadimdemedes/ink-testing-library).
Here's a simple example that checks how the component is rendered:

```jsx
import React from 'react';
import {Text} from 'ink';
import {render} from 'ink-testing-library';

const Test = () => <Text>Hello World</Text>;
const {lastFrame} = render(<Test />);

lastFrame() === 'Hello World'; //=> true
```

Check out [ink-testing-library](https://github.com/vadimdemedes/ink-testing-library) for more examples and full documentation.

---

