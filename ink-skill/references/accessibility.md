# Screen Reader Support

Ink has basic support for screen readers.

To enable it, you can either pass the `isScreenReaderEnabled` option to the `render` function or set the `INK_SCREEN_READER` environment variable to `true`.

Ink implements a small subset of functionality from the [ARIA specification](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA).

```jsx
render(<MyApp />, {isScreenReaderEnabled: true});
```

When screen reader support is enabled, Ink will try its best to generate a screen-reader-friendly output.

For example, for this code:

```jsx
<Box aria-role="checkbox" aria-state={{checked: true}}>
	<Text>Accept terms and conditions</Text>
</Box>
```

Ink will generate the following output for screen readers:

```
(checked) checkbox: Accept terms and conditions
```

You can also provide a custom label for screen readers if you want to render something different for them.

For example, if you are building a progress bar, you can use `aria-label` to provide a more descriptive label for screen readers.

```jsx
<Box>
	<Box width="50%" height={1} backgroundColor="green" />
	<Text aria-label="Progress: 50%">50%</Text>
</Box>
```

In the example above, the screen reader will read "Progress: 50%" instead of "50%".

## `aria-label`

Type: `string`

A label for the element for screen readers.

## `aria-hidden`

Type: `boolean`\
Default: `false`

Hide the element from screen readers.

## aria-role

Type: `string`

The role of the element.

Supported values:
- `button`
- `checkbox`
- `radio`
- `radiogroup`
- `list`
- `listitem`
- `menu`
- `menuitem`
- `progressbar`
- `tab`
- `tablist`
- `timer`
- `toolbar`
- `table`

## aria-state

Type: `object`

The state of the element.

Supported values:
- `checked` (boolean)
- `disabled` (boolean)
- `expanded` (boolean)
- `selected` (boolean)

## Creating Accessible Components

When building custom components, it's important to keep accessibility in mind. While Ink provides the building blocks, ensuring your components are accessible will make your CLIs usable by a wider audience.

### General Principles

- **Provide screen reader-friendly output:** Use the `useIsScreenReaderEnabled` hook to detect if a screen reader is active. You can then render more descriptive output for screen reader users.
- **Leverage ARIA props:** For components that have a specific role (e.g., a checkbox or button), use the `aria-role`, `aria-state`, and `aria-label` props on `<Box>` and `<Text>` to provide semantic meaning to screen readers.
