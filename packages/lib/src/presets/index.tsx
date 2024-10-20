import { useTheme } from '../hooks/use-theme.js'
import type { BetterTmuxConfig, WindowConfig } from '../types.js'

const Window = ({ type, number, name }: WindowConfig) => {
  const theme = useTheme()
  const style = type === "active" ? { bg: theme.primary, fg: theme.foreground } : {}

  return (
    <box padding={1} {...style}>
      {number}: {name}
    </box>
  )
}

export const minimal = {
  window: (window) => <Window {...window} />
} satisfies BetterTmuxConfig
