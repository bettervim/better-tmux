import { Box, BetterTmuxConfig, WindowConfig, useTheme } from 'better-tmux'
import { Hostname } from 'better-tmux/widgets'

const Window = ({ type, number, name }: WindowConfig) => {
  let theme = useTheme()
  let styles = type === "active" ? { bg: theme.primary, fg: theme.background } : {}

  return (
    <Box padding={1} {...styles}>
      {number}: {name}
    </Box>
  )
}


const StatusLeft = () => (
  <Hostname />
)

export default {
  statusLeft: <StatusLeft />,
  window: (window) => <Window {...window} />
} satisfies BetterTmuxConfig
