import { Box, BetterTmuxConfig, WindowConfig } from 'better-tmux'
import { Hostname } from 'better-tmux/widgets'

const Window = ({ number, name }: WindowConfig) => {
  return (
    <Box padding={1}>
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
