type options =
  | StatusFg(string)
  | StatusBg(string)
  | StatusLeft(string)
  | StatusRight(string)
  | StatusPosition(string)
  | WindowStatusCurrentFormat(string)
  | WindowStatusFormat(string)
  | TerminalOverrides(string)
  | EscapeTime(int)
  | PaneBaseIndex(int)
  | StatusKeys(string)
  | ModeKeys(string)
  | SetTitles(string)
  | SetTitlesString(string)
  | Prefix(string)
  | BaseIndex(int)
  | HistoryLimit(int)
  | DefaultTerminal(string)
  | Mouse(string)
  | RenumberWindows(string)
  | AggressiveResize(string)

type command =
  | SetGlobal(options)
  | SetOverrideGlobal(options)
  | Bind(string, string, array<string>)

let parseOptions = options =>
  switch options {
  | StatusFg(value) => `status-fg "${value}"`
  | StatusBg(value) => `status-bg "${value}"`
  | StatusLeft(value) => `status-left "${value}"`
  | StatusRight(value) => `status-right "${value}"`
  | StatusPosition(value) => `status-position "${value}"`
  | WindowStatusCurrentFormat(value) => `window-status-current-format "${value}"`
  | WindowStatusFormat(value) => `window-status-format "${value}"`
  | TerminalOverrides(value) => `terminal-overrides "${value}"`
  | EscapeTime(value) => `escape-time "${value->Int.toString}"`
  | PaneBaseIndex(value) => `pane-base-index "${value->Int.toString}"`
  | StatusKeys(value) => `status-keys "${value}"`
  | ModeKeys(value) => `mode-keys "${value}"`
  | SetTitles(value) => `set-titles ${value}`
  | SetTitlesString(value) => `set-titles-string "${value}"`
  | Prefix(value) => `prefix "${value}"`
  | BaseIndex(value) => `base-index "${value->Int.toString}"`
  | HistoryLimit(value) => `history-limit "${value->Int.toString}"`
  | DefaultTerminal(value) => `default-terminal "${value}"`
  | Mouse(value) => `mouse "${value}"`
  | RenumberWindows(value) => `renumber-windows ${value}`
  | AggressiveResize(value) => `aggressive-resize ${value}`
  }

let parse = command =>
  switch command {
  | SetGlobal(options) => `tmux set -g ${options->parseOptions}`
  | SetOverrideGlobal(options) => `tmux set -ga ${options->parseOptions}`
  | Bind(key, command, options) => `tmux bind ${key} ${command} ${options->Array.join(" ")}`
  }

let exec = command => {
  let parsedCommand = command->parse
  Debug.log(parsedCommand)
  parsedCommand->ChildProcess.execSync->ignore
}
