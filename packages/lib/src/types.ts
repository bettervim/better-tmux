export type WindowConfig = {
  number: number,
  name: string,
  active: boolean
}

export type BetterTmuxConfig = {
  statusLeft?: JSX.Element,
  statusRight?: JSX.Element,
  window?: (config: WindowConfig) => JSX.Element
}
