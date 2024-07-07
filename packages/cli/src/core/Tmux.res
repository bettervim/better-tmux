type options = 
  | StatusFg(string)
  | StatusBg(string)
  | StatusLeft(string)
  | StatusRight(string)
  | WindowStatusCurrentFormat(string)
  | WindowStatusFormat(string)

type command = SetGlobal(options)

let parseOptions = options => switch options {
  | StatusFg(value) => `status-fg "${value}"`
  | StatusBg(value) => `status-bg "${value}"`
  | StatusLeft(value) => `status-left "${value}"`
  | StatusRight(value) => `status-right "${value}"`
  | WindowStatusCurrentFormat(value) => `window-status-current-format "${value}"`
  | WindowStatusFormat(value) => `window-status-format "${value}"`
}

let parse = command => switch command {
  | SetGlobal(options) => `tmux set -g ${options->parseOptions}`
}

let exec = (command) => command->parse->ChildProcess.execSync->ignore
