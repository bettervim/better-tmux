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

type Bind = `${string}-${string}`
type Toggle = "on" | "off"

export type Options = {
  terminalOverrides?: string,
  escapeTime?: number,
  paneBaseIndex?: number,
  statusKeys?: "vi" | "emacs" ,
  modeKeys?: "vi" | "emacs",
  setTitles?: Toggle,
  setTitlesString?: string,
  prefix?: Bind,
  baseIndex?: number,
  historyLimit?: number,
  defaultTerminal?: string,
  mouse?: string,
  renumberWindows?: Toggle,
  aggressiveResize?: boolean,
}

export type BetterTmuxConfig = {
  theme?: Theme, 
  status?: Status,
  window?: (config: WindowConfig) => JSX.Element
}
