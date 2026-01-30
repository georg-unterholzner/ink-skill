# Using React Devtools

Ink supports [React Devtools](https://github.com/facebook/react/tree/master/packages/react-devtools) out of the box. To enable integration with React Devtools in your Ink-based CLI, first ensure you have installed the optional `react-devtools-core` dependency, and then run your app with the `DEV=true` environment variable:

```sh
DEV=true my-cli
```

Then, start React Devtools itself:

```sh
npx react-devtools
```

After it starts, you should see the component tree of your CLI.
You can even inspect and change the props of components, and see the results immediately in the CLI, without restarting it.

**Note**: You must manually quit your CLI via <kbd>Ctrl</kbd>+<kbd>C</kbd> after you're done testing.
