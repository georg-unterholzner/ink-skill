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
