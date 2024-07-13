import { useTheme } from '../hooks/use-theme.js'
import { BetterTmuxConfig, WindowConfig } from '../types.js'

const Window = ({ type, number, name }: WindowConfig) => {
  const theme = useTheme()
  let style = type === "active" ? { bg: theme.primary, fg: theme.foreground } : {}

  return (
    <box padding={1} {...style}>
      {number}: {name}
    </box>
  )
}

export const minimal = {
  window: (window) => <Window {...window} />
} satisfies BetterTmuxConfig
