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
curl -sSL https://raw.githubusercontent.com/bettervim/tmux-ease/main/scripts/install.sh | bash
```

## Setting up your config
Clone this repository, and install dependencies using your favorite package manager:

```sh
yarn install
# or pnpm install
# or npm install
```

Modify your `tmux.conf` to execute the CLI on every reload and point to the `index.tsx` of your config folder:
```sh
# ~/tmux.conf
run-shell 'better-tmux --file /path/to/your-config/index.tsx'
```

## Basic usage
Now, navigate to your `index.tsx` file, and modify it to be like this:

```typescript
// /path/to/your-config/index.tsx
import { Box } from 'better-tmux'

const MyStatusLeft = () => (
  <Box bg="#fafafa" fg="#000000" padding={1}>Testing... 🚀</Box>
)

export default {
  statusLeft: <MyStatusLeft />
}
```

Now, reload your `tmux.conf` (try running `tmux source-file ~/.tmux.conf`) and tada 🎉

## License
MIT
