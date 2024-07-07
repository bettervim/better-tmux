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
}

export type BetterTmuxConfig = {
  theme?: Theme, 
  status?: Status,
  window?: (config: WindowConfig) => JSX.Element
}
