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
