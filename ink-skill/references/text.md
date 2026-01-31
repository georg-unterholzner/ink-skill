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
