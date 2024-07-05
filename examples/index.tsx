import { Box, BetterTmuxConfig, WindowConfig, useTheme } from 'better-tmux'

const Window = ({ number, name }: WindowConfig) => {
  const theme = useTheme()

  return (
    <Box padding={1}>
      {number}: {name}
    </Box>
  )
}

export default {
  window: (window) => <Window {...window} />
} satisfies BetterTmuxConfig
