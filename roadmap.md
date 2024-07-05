## Features

- [x] Support for status-left
- [x] Support for status-right
- [x] Support for custom components using box and text
- [ ] Support for predefined themes
    - [ ] Dracula
    - [ ] Nord
    - [ ] Catppuccin
    - [ ] Ayu
- [ ] Support for custom global options
- [ ] Support for custom bindings
- [ ] Provide a starter using create-better-tmux-app
- [ ] Provide custom widgets and presets
- [ ] Publish cli binary publicly via shell

## Features
Support for status-left and status-right:
```javascript
import { Text } from 'better-tmux'

const MyStatusLeft = () => (
  <Text>Test..</Text>
)

export default {
  statusLeft: <MyStatusLeft />,
  statusRight: <MyStatusLeft />
}
```

Support for custom window:
```javascript
const Window = ({ active, number, name }) => {
  <box>
    {number} / {name}
  </box>
}

export default {
  window: (props) => <Window {...props} />
}
```
