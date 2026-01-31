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
