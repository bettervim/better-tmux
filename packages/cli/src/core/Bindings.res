let execute = (bindings: array<Config.bind>) => {
  bindings->Array.forEach(bind => {
    Tmux.exec(Bind(bind.key, bind.command, bind.options->Option.getOr([])))
  })
}
