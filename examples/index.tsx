import { Box, BetterTmuxConfig, WindowConfig, useTheme, tmux } from 'better-tmux'
import { Clock, SessionName } from 'better-tmux/widgets'

const Window = ({ type, number, name }: WindowConfig) => {
  let theme = useTheme()
  let styles = type === "active" ? { bg: theme.primary, fg: theme.background, bold: true } : {}

  return (
    <Box padding={1} {...styles}>
      {number}: {name}
    </Box>
  )
}

const StatusLeft = () => (
  <Box>
    <SessionName />
  </Box>
)

const StatusRight = () => (
  <Box>
    <Clock format={`${tmux.globals.hour_12}:${tmux.globals.minute}`} />
  </Box>
)

export default {
  statusLeft: <StatusLeft />,
  statusRight: <StatusRight />,
  window: (window) => <Window {...window} />
} satisfies BetterTmuxConfig
