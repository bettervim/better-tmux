import { defineConfig } from './Main.res.js'

const MyStatusLeft = () => (
  <box>
    <box style={{ bg: "#a9a9a9", fg: "#000000", bold: true }}>
      {" 🕑 "}
    </box>
    <box style={{ bg: "#fc3666", fg: "#000000", bold: true }}>
      {` ${new Date().getHours()}:${new Date().getMinutes()} `}
    </box>
  </box>
)

export default defineConfig({
  statusLeft: <MyStatusLeft />
})
