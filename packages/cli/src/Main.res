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

type windowParams = {
  active: bool,
  number: string,
  name: string,
}

type window = windowParams => TmuxJsx.element

type config = {
  statusLeft: option<TmuxJsx.element>,
  statusRight: option<TmuxJsx.element>,
  window: option<window>,
}
type mod = {default: config}

type flags<'value> = {file: 'value}

module Window = {
  let render = (window: window) => {
    let activeWindow = window({
      active: true,
      name: "#W",
      number: "#I",
    })

    let normalWindow = window({
      active: false,
      name: "#W",
      number: "#I",
    })

    let activeRoot: Reconcilier.root = {
      mount: tree => {
        let body = Parser.make(tree)
        Tmux.exec(SetGlobal(WindowStatusFormat(body)))
      },
    }

    let normalRoot: Reconcilier.root = {
      mount: tree => {
        let body = Parser.make(tree)
        Tmux.exec(SetGlobal(WindowStatusCurrentFormat(body)))
      },
    }

    Reconcilier.render(activeWindow, activeRoot)
    Reconcilier.render(normalWindow, normalRoot)
  }
}

@val external import_: string => promise<mod> = "import"

let run = async () => {
  let options: flags<BunX.flag> = {
    file: {type_: "string"},
  }

  let {values}: BunX.parseArgs<flags<string>> = BunX.parseArgs({
    args: Bun.argv,
    options,
    strict: true,
    allowPositionals: true,
  })
  let path = Path.resolve([values.file])
  let {default: config} = await import_(path)

  switch config.statusLeft {
  | None => ()
  | Some(statusLeft) => Reconcilier.render(statusLeft, Roots.statusLeft)
  }

  switch config.statusRight {
  | None => ()
  | Some(statusRight) => Reconcilier.render(statusRight, Roots.statusRight)
  }

  switch config.window {
  | None => ()
  | Some(window) => Window.render(window)
  }
}

run()->ignore
