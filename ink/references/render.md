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
