import { Text } from 'better-tmux'

const MyStatusLeft = () => (
  <Text>Test..</Text>
)

export default {
  statusLeft: <MyStatusLeft />,
  statusRight: <MyStatusLeft />
}
