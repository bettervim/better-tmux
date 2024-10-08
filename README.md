> [!WARNING]
> 💡  This project is experimental and still in progress, but definitely worth trying. If you encounter any issues, please open an issue or DM me on [Twitter](https://x.com/vmaarcosp). Don't hesitate to reach out 👋🏻

<div align="center">
  <h1>BetterTmux</h1>
  <p>Unlock the full power of TMUX with TypeScript and JSX ⚡</p>
</div>

<image src="./assets/preview-v1.png" />

## Features

- ⚙️ Support for TMUX customizations trough TypeScript and React
- 🎨 Theme management + popular themes
- 📦 Pre-built widgets such as `<Hostname />`, `<Clock />`, `<SessionName />`, etc 
- 💡 Ability to create your own widgets using native building blocks `<Box />` adn `<Text />` 

## Introduction
BetterTmux is essentially a framework for TMUX that leverages React and TypeScript to enable powerful customizations. It allows you to create your own custom components and configurations for the TMUX status bar. Additionally, it provides a layer of pre-built components that help you unlock the full potential of your TMUX setup.

## Why

TMUX is incredible and boosts productivity, but configuring it can be tough. You can either use a pre-made config like "oh my tmux", which can be challenging to customize, or build your own from scratch, which can be overwhelming depending on your experience. If you try to use a plugin theme like [Nord](https://github.com/nordtheme/tmux) or [Catppuccin](https://github.com/catppuccin/tmux) to match your vim or terminal theme, you'll notice that it doesn't only change the colors but also affects your widgets and layout.

I've been tweaking my own tmux config for years, and I've ended up with complex configurations like this:

<details>
  <summary>
  Click to reveal 🔎
 </summary>

   ```sh
    set -g status-left-length 50
    set -g status-left "#(hostname) #[bg=$theme_primary,fg=$theme_background] 🚀 #[bg=$theme_background,fg=$theme_foreground] Test "
    
    set -g status-right-length 50
    set -g status-right "#[bg=$theme_primary,fg=$theme_background] %Y-%m-%d #[bg=$theme_background,fg=$theme_foreground] %H:%M:%S "
    
    set -g window-status-format "#[bg=$theme_background,fg=$theme_foreground] #I: #W "
    set -g window-status-current-format "#[bg=$theme_primary,fg=$theme_background] #I: #W "
    
    set -g status-style "bg=$theme_background,fg=$theme_foreground"
``` 
 
</details>



On the other hand, TypeScript (and JavaScript) plus JSX are great ways to handle UIs. So, what if you could configure your TMUX using these technologies? 
Here is a very similar example of the code above but using BetterTmux:
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
    prefix: 'C-a',
    setTitlesString: "BetterTmux",
  },
  status: {
    left: <CustomStatusLeft />,
    right: <Clock />,
    position: 'top'
  },
  window: (window) => <Window {...window} />
} satisfies BetterTmuxConfig
```

## Documentation 📘

- [Setup](./docs/1-setup.md)
  - [Install](./docs/1-setup.md#install)
  - [Setting up your config](./docs/1-setup.md#setting-up-your-config)
  - [Testing](./docs/1-setup.md#testing)
  - [Update](./docs/1-setup.md#update)
  - [Uninstall](./docs/1-setup.md#uninstall)
- [Basic Usage](./docs/2-basic-usage.md)
  - [Understanding customizations](./docs/2-basic-usage.md#understanding-customizations)
  - [Usage of index.tsx](./docs/2-basic-usage.md#usage-of-indextsx)
  - [Integrating with tmux.conf](./docs/2-basic-usage.md#integrating-with-your-tmuxconf)
  - [BetterTmux packages](./docs/2-basic-usage.md#bettertmux-packages-better-tmux)
- [API Reference](./docs/3-api-reference.md)
  - [Configuration](./docs/3-api-reference.md#configuration)
  - [Themes](./docs/3-api-reference.md#themes)
  - [Components](./docs/3-api-reference.md#components)
  - [Example](./docs/3-api-reference.md#example)
  - [Hooks](./docs/3-api-reference.md#hooks)
  - [Widgets](./docs/3-api-reference.md#widgets)
  - [Utilities](./docs/3-api-reference.md#utilities)
    
## FAQ

**"Is this project a replacement for my `tmux.conf`?"**

- **Short answer**: Not yet.
- **Long answer**: This is our plans for this project. Currently, we don't support all possible tmux configurations and options, but we plan to support the most common ones.

**"What happens if I need something that is not supported by BetterTmux?"**
- We recommend using your `tmux.conf` alongside BetterTmux. This allows you to use any native tmux command as an escape hatch.


## License
MIT
