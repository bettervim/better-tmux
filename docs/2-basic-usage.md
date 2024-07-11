[← Back](./1-setup.md) / [Next →](./3-api-reference.md)

# 2. Basic Usage
- [Understanding customizations](2-basic-usage.md#understanding-customizations)
- [Usage of index.tsx](2-basic-usage.md#usage-of-indextsx)
- [Integrating with tmux.conf](2-basic-usage.md#integrating-with-your-tmuxconf)
- [BetterTmux packages](2-basic-usage.md#bettertmux-packages-better-tmux)

As we did previously, you used a template to set up your config. This template is essentially a JavaScript/TypeScript project with React pre-configured and `better-tmux` installed.

From this template, the only thing you need to focus on is the `index.tsx`; the rest works like any JavaScript project.

## Understanding customizations
After cloning and setting up your config using our template, you'll end up with something like that in your config:
```typescript
import { BetterTmuxConfig, Box, WindowConfig, useTheme } from 'better-tmux'
import { Clock, Hostname } from 'better-tmux/widgets'

const Window = ({ type, number, name }: WindowConfig) => {
  const theme = useTheme()
  return (
    <Box 
      padding={1} 
      bg={type === 'active' ? theme.primary : theme.background}
      fg={type === 'active' ? theme.background : theme.foreground}
    >
      {number}: {name}
    </Box>
  )
}

const CustomStatusLeft = () => {
  const theme = useTheme()

  return (
    <Box>
      <Hostname />
      <Box bg={theme.primary} padding={1}>🚀</Box>
      <Box bg={theme.background} fg={theme.foreground} padding={1}>Test</Box>
    </Box>

  )
}

export default {
  theme: 'nord',
  options: {
    prefix: 'C-a'
  },
  status: {
    left: <CustomStatusLeft />,
    right: <Clock />,
    position: 'top'
  },
  window: (window) => <Window {...window} />
} satisfies BetterTmuxConfig
```

Let's break this customizastion into multiple parts to understand what we're doing in here 🏃

### Customizing windows
As you might know, TMUX allows you to create multiple windows per session. One of the most common customizations is modifying the window appearance, such as setting a layout for the window (e.g., `(number): (name)`) or changing the colors for each state (active, normal, zoomed, etc.).

With BetterTmux, all you need to customize your windows is to create a component that receives props of type `WindowConfig` and returns the layout and UI you want. After that, you just need to export this component as a field of the object config `window`. Here is an example:

```typescript
const Window = ({ type, number, name }: WindowConfig) => {
  const theme = useTheme()
  return (
    <Box 
      padding={1} 
      bg={type === 'active' ? theme.primary : theme.background}
      fg={type === 'active' ? theme.background : theme.foreground}
    >
      {number}: {name}
    </Box>
  )
}

export default {
  // ... other customizations
  window: (window) => <Window {...window} />
}
```

> 💡 You can use the `type` prop to display different colors or layout based on the type of window, for example: `active` windows are blue, and `normal` are red.

### Customizing status bar
TMUX has a status bar with two parts, a status-left and a status-right, with additional configurations related to the status bar itself. 

In the above example, we've made some customizations to it, modifying the layout of status-left, status-right, and status-position. 

To customize both status-left and status-right, you can create your own component to display pre-built widgets or create your own from scratch using BetterTmux building blocks. After that, you just need to attach them to the config via the status object:

```typescript
const CustomStatusLeft = () => {
  const theme = useTheme()

  return (
    <Box>
      <Hostname />
      <Box bg={theme.primary} padding={1}>🚀</Box>
      <Box bg={theme.background} fg={theme.foreground} padding={1}>Test</Box>
    </Box>

  )
}
export default {
  status: {
    left: <CustomStatusLeft />,
    position: 'top'
  },
}
```
Additionally, you can modify other aspects of the status, like `bg` (background color) or even its position. To see more, check out the [API reference of the object config](https://github.com/bettervim/better-tmux/blob/main/docs/3-api-reference.md#configuration).

### Themes
As you might have noticed, BetterTmux can handle themes, which is an important part of your configuration. If you've used TMUX for a while, you'll know that changing your TMUX theme often means changing your TMUX layout as well. However, BetterTmux handles theme changes without affecting the UI.

Whether you're switching your status bar using pre-built widgets or building your own, if you want to change the theme to fit your config (like vim or terminal), all you need to do is change the `theme` field in the configuration.

To ensure your customizations remain consistent with the current theme, use the `useTheme` hook like we did in the example above:
```typescript
const CustomStatusLeft = () => {
  const theme = useTheme()

  return (
    <Box>
      <Hostname />
      <Box bg={theme.primary} padding={1}>🚀</Box>
      <Box bg={theme.background} fg={theme.foreground} padding={1}>Test</Box>
    </Box>

  )
}
```

### Setting global options

A common task when creating a `tmux.conf` is setting global options. This probably makes up 50% of your config, right? BetterTmux offers a way to do that via the `options` object. For example, if you need to set a title for your session, you would use `tmux set -g set-titles-string "title :)"`. With BetterTmux, you can do it like this:
```typescript
export default {
  options: { setTitlesString: "title :)" }
}
```

Check out the `options` [API Reference](https://github.com/bettervim/better-tmux/blob/main/docs/3-api-reference.md#configuration) to see more.

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


[← Back](./1-setup.md) / [Next →](./3-api-reference.md)
