import { BetterTmuxConfig } from '../types.js'

const MyStatus = () => (
  <box>Test..</box>
)

export const minimal = {
  statusLeft: <MyStatus />,
  statusRight: <MyStatus />
} satisfies BetterTmuxConfig
