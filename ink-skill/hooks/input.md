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
