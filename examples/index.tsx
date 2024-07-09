import { Box, BetterTmuxConfig, WindowConfig, useTheme, tmux } from 'better-tmux'
import { Date, SessionName } from 'better-tmux/widgets'

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
    <Date format={`${tmux.globals.abbreviated_month} ${tmux.globals.day}`} />
  </Box>
)

export default {
  theme: 'catppuccin-latte',
  options:{
    setTitlesString: " ",
  },
  status: {
    left: <StatusLeft />,
    right: <StatusRight />,
    position: 'top'
  },
  window: (props) => <Window {...props} />
} satisfies BetterTmuxConfig
