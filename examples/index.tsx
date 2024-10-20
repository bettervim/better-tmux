import {
  Box,
  type BetterTmuxConfig,
  type WindowConfig,
  useTheme,
  tmux,
} from "better-tmux";
import { Calendar, SessionName } from "better-tmux/widgets";

const Window = ({ type, number, name }: WindowConfig) => {
  const theme = useTheme();
  const styles =
    type === "active"
      ? { bg: theme.primary, fg: theme.background, bold: true }
      : {};

  return (
    <Box padding={1} {...styles}>
      {number}: {name}
    </Box>
  );
};

const StatusLeft = () => (
  <Box>
    <SessionName />
  </Box>
);

const StatusRight = () => (
  <Box>
    <Calendar
      format={`${tmux.globals.abbreviated_month} ${tmux.globals.day}`}
    />
  </Box>
);

export default {
  theme: "ayu-light",
  bindings: [
    {
      key: "x",
      command: "kill-window",
    },
  ],
  options: {
    setTitlesString: " ",
    prefix: "C-a",
  },
  status: {
    left: <StatusLeft />,
    right: <StatusRight />,
    position: "top",
  },
  window: (props) => <Window {...props} />,
} satisfies BetterTmuxConfig;
