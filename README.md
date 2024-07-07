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

TMUX is incredible and boosts productivity, but configuring it can be tough. You can either use a pre-made config like "oh my tmux", which can be challenging to customize, or build your own from scratch, which can be overwhelming depending on your experience. If you try to use a plugin theme like nord or catppuccin to match your vim or terminal theme, you'll notice that it doesn't only change the colors but also affects your widgets and layout.

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
  status: {
    left: <CustomStatusLeft />,
    right: <Clock />
  },
  window: (window) => <Window {...window} />
} satisfies BetterTmuxConfig
```
## Getting started

Getting started with BetterTmux takes less than 2 minutes. Check out our [documentation](./docs/README.md) to begin customizing your tmux environment.

## License
MIT
