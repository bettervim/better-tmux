module Roots = {
  let statusLeft: Reconcilier.root = {
    mount: tree => {
      let body = Parser.make(tree)
      Tmux.exec(SetGlobal(StatusLeft(body)))
    },
  }
}

type config = {statusLeft: TmuxJsx.element}

let defineConfig = config => {
  Reconcilier.render(config.statusLeft, Roots.statusLeft)
}
