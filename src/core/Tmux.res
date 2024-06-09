type options = 
  | StatusLeft(string)
  | StatusRight(string)

type command = SetGlobal(options)

let parseOptions = options => switch options {
  | StatusLeft(value) => `status-left "${value}"`
  | StatusRight(value) => `status-right "${value}"`
}

let parse = command => switch command {
  | SetGlobal(options) => `tmux set -g ${options->parseOptions}`
}

let exec = (command) => command->parse->ChildProcess.execSync->ignore
