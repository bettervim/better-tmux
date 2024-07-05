import { BetterTmuxConfig, WindowConfig } from '../types.js'

const Window = ({ number, name }: WindowConfig) => (
  <box padding={1} bg="#fafafa" fg="#000000">
    {number}: {name} 
  </box>
)

export const minimal = {
  window: (window) => <Window {...window} />
} satisfies BetterTmuxConfig
