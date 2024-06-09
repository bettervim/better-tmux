```typescript
import { selectPane } from 'better-tmux'
import { Clock } from 'better-tmux/widgets'
import { StatusRight } from 'better-tmux/presets/minimal'

const MyStatusLeft = () => (
  <box>
    <Clock />   
  </box>
)

const Window = ({ window }) => (
  <box style={{ bg: "#fafafa" }}>
    {window.number}:{window.name}
  </box>
)

export default defineConfig({
  statusLeft: <MyStatusLeft /> ,
  statusRight: <StatusRight />, 
  window: (window) <Window {...window} />,
  binds: {
    h: selectPane({ direction: "R" })
  }
})
```
