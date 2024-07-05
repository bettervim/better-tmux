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

export type BetterTmuxConfig = {
  theme?: Theme, 
  statusLeft?: JSX.Element,
  statusRight?: JSX.Element,
  window?: (config: WindowConfig) => JSX.Element
}
