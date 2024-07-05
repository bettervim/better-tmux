import { BetterTmuxConfig, WindowConfig } from '../types.js'

const Window = ({ type, number, name }: WindowConfig) => {
  let style = type === "active" ? { bg: "#fafafa", fg: "#000000" } : {}

  return (
    <box padding={1} {...style}>
      {number}: {name}
    </box>
  )
}

export const minimal = {
  window: (window) => <Window {...window} />
} satisfies BetterTmuxConfig
