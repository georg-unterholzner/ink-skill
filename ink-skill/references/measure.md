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
