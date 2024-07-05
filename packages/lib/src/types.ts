export type WindowConfig = {
  number: number,
  name: string,
  type: "active" | "normal" 
}

export type BetterTmuxConfig = {
  statusLeft?: JSX.Element,
  statusRight?: JSX.Element,
  window?: (config: WindowConfig) => JSX.Element
}
