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
