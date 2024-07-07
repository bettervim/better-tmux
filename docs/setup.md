[← Back](./setup.md) / [Next →](./api-reference.md)

# 2. Basic Usage

As we did previously, you used a template to set up your config. This template is essentially a JavaScript/TypeScript project with React pre-configured and `better-tmux` installed.

From this template, the only thing you need to focus on is the `index.tsx`; the rest works like any JavaScript project.

## Usage of `index.tsx`

The main configuration file for BetterTmux is `index.tsx`. This file is where you define your tmux setup using TypeScript and JSX. You'll notice that this file exports an object with your customizations. These configurations are read by the BetterTmux CLI and do the magic for you. To better understand the flow, it's basically like this:
1. Write your customizations using React.
2. Run `better-tmux --file /path/to/your-config/index.tsx`.
3. And tada 🎉

Notice that the `better-tmux` CLI reads your object and transforms everything into tmux native configs.

## Integrating with your `tmux.conf`

A common and productive approach is to keep your configs together in dotfiles. BetterTmux fits perfectly into this use case if you integrate it with your `tmux.conf` file. Since `tmux.conf` is essentially a file read by tmux, all you need to do is add a line to ensure that every reload of your tmux also executes the `better-tmux` CLI:

```sh
# ~/tmux.conf
run-shell 'better-tmux --file /path/to/your-config/index.tsx'
```

## BetterTmux Packages (`better-tmux`)

Along with the setup, you'll install the `better-tmux` package. This package exports some useful resources for your config:

- Building blocks: `<Box />` and `<Text />`
- Pre-built widgets: `<Hostname />`, `<Clock />`, `<SessionName />`, etc.
- TMUX global variables through `tmux`, such as `tmux.globals.sessionName`
- Hooks: `useTheme()`

These resources are used internally by presets and components, but they are available for you to build your own customizations.

Check out the [API Reference](./api-reference.md) to see more.


[← Back](./setup.md) / [Next →](./api-reference.md)
