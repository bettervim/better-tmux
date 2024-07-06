> 💡  This project is experimental and still in progress, and there is no documentation available yet 😅, but definitely worth trying. If you encounter any issues, please open an issue or DM me on [Twitter](https://x.com/vmaarcosp). Don't hesitate to reach out 👋🏻

# better-tmux ⚡
Unlock the full power of TMUX with TypeScript and JSX.

<image src="./assets/preview.png" />

## Motivation
TMUX is incredible and boosts productivity, but configuring it is tough. You can either use a pre-made config like "oh my tmux" with many widget options or create your own and struggle with complex setups. TMUX relies on shell scripts, making UI customization a challenge. Here's a stylish TMUX configuration example:

```sh
set -g status-left-length 50
set -g status-left "#[fg=colour148,bg=colour235] #H #[fg=colour235,bg=colour148,nobold,noitalics,nounderscore]"
set -g status-right-length 150
set -g status-right "#[fg=colour235,bg=colour148,nobold,noitalics,nounderscore]#[fg=colour148,bg=colour235] %Y-%m-%d #[fg=colour148,bg=colour235,nobold,noitalics,nounderscore]#[fg=colour235,bg=colour136] %H:%M:%S #[fg=colour235,bg=colour136,nobold,noitalics,nounderscore]#[fg=colour136,bg=colour235] Session: #S "
```

On the other hand, TypeScript (and JavaScript) plus JSX are a great way to deal with UIs, so, what if you could configure your TMUX using these two technologies? Here we go 🏃

## Installation
Install `better-tmux` CLI:
```sh
curl -sSL https://raw.githubusercontent.com/bettervim/better-tmux/main/scripts/install.sh | bash
```

## Update
Install `better-tmux` CLI:
```sh
curl -sSL https://raw.githubusercontent.com/bettervim/better-tmux/main/scripts/update.sh | bash
```

## Setting up your config
In the folder where you want to store your configuration (we recommend ~/), run the following command:
```sh
git clone https://github.com/bettervim/better-tmux-template.git ~/better-tmux && rm -rf better-tmux/.git
```
Now, install the dependencies using your favorite package manager:

```sh
pnpm install
# or bun install
# or yarn install
# or npm install
```

## Testing

To test changes in your configuration, you'll need to run the better-tmux CLI, specifying your configuration file. For example:
```sh
better-tmux ~/better-tmux/index.tsx
```

We recommend you to modify your `tmux.conf` to execute the CLI on every reload and point to the `index.tsx` of your config folder:
```sh
# ~/tmux.conf
run-shell 'better-tmux --file ~/better-tmux/index.tsx'
```

## Basic usage
Now, navigate to your `index.tsx` file, and modify it to be like this:

```typescript
// /path/to/your-config/index.tsx
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

Now, reload your `tmux.conf` (try running `tmux source-file ~/.tmux.conf`) and tada 🎉

## Uninstall
```sh
curl -sSL https://raw.githubusercontent.com/bettervim/better-tmux/main/scripts/uninstall.sh | bash
```

## License
MIT
