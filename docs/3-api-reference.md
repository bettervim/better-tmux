[← Back](./2-basic-usage.md) / [Next →](./4-guides.md)

# 3. API Reference
- [Configuration](3-api-reference.md#configuration)
- [Themes](3-api-reference.md#themes)
- [Components](3-api-reference.md#components)
- [Example](3-api-reference.md#example)
- [Hooks](3-api-reference.md#hooks)
- [Widgets](3-api-reference.md#widgets)
- [Utilities](3-api-reference.md#utilities)

## Configuration
The exported object has the following type signature and options:
```typescript
export type WindowConfig = {
  number: number,
  name: string,
  type: "active" | "normal"
}

export type Theme =
  | "catppuccin-mocha"
  | "catppuccin-latte"
  | "catppuccin-macchiato"
  | "catppuccin-frappe"
  | "nord"
  | "dracula"

export type Status = {
  fg?: string,
  bg?: string,
  left?: JSX.Element,
  right?: JSX.Element,
  position?: "top" | "bottom"
}


type Toggle = "on" | "off"

export type Options = {
  terminalOverrides?: string,
  escapeTime?: number,
  paneBaseIndex?: number,
  statusKeys?: "vi" | "emacs",
  modeKeys?: "vi" | "emacs",
  setTitles?: Toggle,
  setTitlesString?: string,
  prefix?: string,
  baseIndex?: number,
  historyLimit?: number,
  defaultTerminal?: string,
  mouse?: string,
  renumberWindows?: Toggle,
  aggressiveResize?: boolean,
}

type TmuxCommand =
  | 'select-pane'
  | 'new-window'
  | 'new-window'
  | 'split-window'
  | 'select-pane'
  | 'select-window'
  | 'kill-pane'
  | 'kill-window'
  | 'resize-pane'
  | 'swap-pane'
  | 'rename-window'
  | 'list-panes'
  | 'list-windows'
  | 'list-sessions'
  | 'attach-session'
  | 'detach-client'
  | 'show-messages'
  | 'display-message'
  | 'copy-mode'
  | 'paste-buffer'

export type Bind = {
  key: string,
  command: TmuxCommand,
  options?: string[]
}

export type BetterTmuxConfig = {
  bindings?: Bind[],
  options?: Options,
  theme?: Theme,
  status?: Status,
  window?: (config: WindowConfig) => JSX.Element
}
```

## Themes
The supported themes are:
  - Catppuccin
  - Nord
  - Dracula

> 💡 Do you need a theme? Feel free to open a PR; it's pretty simple. Check out this [file](https://github.com/bettervim/better-tmux/blob/main/packages/lib/src/hooks/use-theme.ts).

## Components
### `<Box />` and `<Text />`

These are the most primitive building blocks of BetterTmux. They offer you a way to create your own components within the BetterTmux runtime.
They are quite similar in practice; you can use only `<Box />` if you want, but I prefer to use `<Text />` sometimes to improve semantics and readability.

### Example

```typescript
import { Box, Text } from 'better-tmux'

const MyStatusLeft = () => (
<Box bg='#000000' padding={1}>
 <Text fg='#fafafa'>Testing :)</Text>
</Box>
)
```

As you notice, since they're components, they can receive props. Here is a complete list of props:

### Props Table

| Prop           | Type    |
| -------------- | ------- |
| `bg`           | string  |
| `fg`           | string  |
| `padding`      | number  |
| `paddingLeft`  | number  |
| `paddingRight` | number  |
| `gap`          | number  |
| `bold`         | boolean |
| `italic`       | boolean |

## Hooks
### useTheme(...)
This hook allows you to get the theme palette based on what you provided to the config object. All the widgets provided by BetterTmux and other defaults are based on this theme.
```typescript
import { useTheme } from 'better-tmux'

const MyWindow = () => {
  const theme = useTheme()
  return <Box bg={theme.primary}>Window</Box>
}
```
**API Reference**
```typescript
const useTheme: void => ThemePalette;

type ThemePalette = {
  background: string,
  foreground: string,
  primary: string,
  secondary: string,
}
```
## Widgets
Widgets are essentially components that you can import and render to any part of the TMUX status bar. 

```typescript
import { SessionName, Clock } from 'better-tmux/widgets'

const MyStatusLeft = () => <Box>
  <SessionName icon="X" />
  <Clock />
</Box>
```

### `<SessionName />`
| Prop           | Type    |
| -------------- | ------- |
| `icon`         | string  |


### `<Hostname />`

| Prop           | Type    |
| -------------- | ------- |
| `icon`         | string  |

### `<Date />`
| Prop           | Type    |
| -------------- | ------- |
| `icon`         | string  |
| `format`       | string  |

### `<Clock />`
```typescript
import { Clock, tmux } from 'better-tmux/widgets'

const MyStatus = () => <Clock format={`${tmux.globals.month}-${tmux.globals.day}-${tmux.globals.year}`} />
```
| Prop           | Type    |
| -------------- | ------- |
| `icon`         | string  |
| `format`       | string  |

> 💡 The format props are used to customize the format and ensure you can format based on your locale.

## Utilities
Some nice utilities that enables you access TMUX globals or work with TMUX native features.
### `tmux` 
A collection of constants, global variables, etc acessible directly via TypeScript. Example:
```typescript
import { tmux } from 'better-tmux'

const MyStatusLeft = () => <Box>{tmux.globals.sessionName}</Box>
```
**API Reference**
```typescript
const tmux: {
  globals: {  
    hostname: string,
    sessionName: string,
    hour_24: string,
    hour_12: string,
    hour_24_single: string,
    hour_12_single: string,
    minute: string,
    second: string,
    am_pm_upper: string,
    am_pm_lower: string,
    year: string, 
    month: string, 
    day: string, 
    abbreviated_month: string, 
    full_month: string, 
    abbreviated_day: string, 
    full_day: string, 
    week_number: string, 
    day_of_year: string, 
    day_of_week_number: string,
  }
}
```

[← Back](./2-basic-usage.md) / [Next →](./4-guides.md)
