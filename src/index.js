import { defineConfig } from './Main.res.js'

const MyStatusLeft = () => (
  <box bg="#000000">
    <box padding={1} bg="#a9a9a9" fg="#000000" bold={true}>
      🕑
    </box>
    <box gap={4} padding={1} bg="#fc3666" fg="#000000" bold={true}>
      <text fg="#000000">
        {`${new Date().getHours()}:${new Date().getMinutes()}`}
      </text>
    </box>
  </box>
)

const MyStatusRight = () => (
  <box bg="#000000">
    <box padding={1} bg="#a9a9a9" fg="#000000" bold={true}>
      {"🚀"}
    </box>
    <box padding={1} bg="#fc3666" fg="#000000" bold={true}>
      {`Let's go!`}
    </box>
  </box >
)


export default defineConfig({
  statusLeft: <MyStatusLeft />,
  statusRight: <MyStatusRight />
})
