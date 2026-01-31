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
