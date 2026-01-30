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
