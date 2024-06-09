module Roots = {
  let statusLeft: Reconcilier.root = {
    mount: tree => {
      let body = Parser.make(tree)
      Tmux.exec(SetGlobal(StatusLeft(body)))
    },
  }

  let statusRight: Reconcilier.root = {
    mount: tree => {
      let body = Parser.make(tree)
      Tmux.exec(SetGlobal(StatusRight(body)))
    },
  }
}

type config = {statusLeft: TmuxJsx.element, statusRight: TmuxJsx.element}

let defineConfig = config => {
  Reconcilier.render(config.statusLeft, Roots.statusLeft)
  Reconcilier.render(config.statusRight, Roots.statusRight)
}
