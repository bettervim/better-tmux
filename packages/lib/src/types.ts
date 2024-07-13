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
  | "onedark"
  | "onelight"
  | "onedark-dark"
  | "onedark-vivid"
  | "tokyonight"
  | "tokyonight-moon"
  | "tokyonight-day"
  | "tokyonight-storm"

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
