let tap = (opt, fn) => opt->Option.map(value => fn(value))->ignore

let execute = (options: Config.options) => {
  options.mouse->tap(v => Tmux.exec(SetGlobal(Mouse(v))))
  options.terminalOverrides->tap(v => Tmux.exec(SetGlobal(TerminalOverrides(v))))
  options.escapeTime->tap(v => Tmux.exec(SetGlobal(EscapeTime(v))))
  options.paneBaseIndex->tap(v => Tmux.exec(SetGlobal(PaneBaseIndex(v))))
  options.statusKeys->tap(v => Tmux.exec(SetGlobal(StatusKeys(v))))
  options.modeKeys->tap(v => Tmux.exec(SetGlobal(ModeKeys(v))))
  options.setTitles->tap(v => Tmux.exec(SetGlobal(SetTitles(v))))
  options.setTitlesString->tap(v => Tmux.exec(SetGlobal(SetTitlesString(v))))
  options.prefix->tap(v => Tmux.exec(SetGlobal(Prefix(v))))
  options.baseIndex->tap(v => Tmux.exec(SetGlobal(BaseIndex(v))))
  options.historyLimit->tap(v => Tmux.exec(SetGlobal(HistoryLimit(v))))
  options.defaultTerminal->tap(v => Tmux.exec(SetGlobal(DefaultTerminal(v))))
  options.renumberWindows->tap(v => Tmux.exec(SetGlobal(RenumberWindows(v))))
  options.aggressiveResize->tap(v => Tmux.exec(SetGlobal(AggressiveResize(v))))
}

