let createRoot = exec => {
  let root: Reconcilier.root = {
    mount: tree => {
      let body = Parser.make(tree)
      exec(body)
    },
  }

  root
}

module StatusRenderer = {
  let leftRoot = createRoot(body => Tmux.exec(SetGlobal(StatusLeft(body))))
  let rightRoot = createRoot(body => Tmux.exec(SetGlobal(StatusRight(body))))

  let render = (~theme: BetterTmux.themePalette, ~status: Config.status) => {
    let statusBg = status.bg->Option.getOr(theme.background)
    let statusFg = status.fg->Option.getOr(theme.foreground)

    switch status.left {
    | Some(tree) => Reconcilier.render(tree, leftRoot)
    | None => Tmux.exec(SetGlobal(StatusLeft("")))
    }

    switch status.right {
    | Some(tree) => Reconcilier.render(tree, rightRoot)
    | None => Tmux.exec(SetGlobal(StatusRight("")))
    }

    Tmux.exec(SetGlobal(StatusBg(statusBg)))
    Tmux.exec(SetGlobal(StatusFg(statusFg)))
  }
}

type flags<'value> = {file: 'value}

module WindowRenderer = {
  let activeRoot = createRoot(body => Tmux.exec(SetGlobal(WindowStatusCurrentFormat(body))))
  let normalRoot = createRoot(body => Tmux.exec(SetGlobal(WindowStatusFormat(body))))

  let render = (window: Config.window) => {
    Reconcilier.render(
      window({
        type_: #active,
        name: "#W",
        number: "#I",
      }),
      activeRoot,
    )

    Reconcilier.render(
      window({
        type_: #normal,
        name: "#W",
        number: "#I",
      }),
      normalRoot,
    )
  }
}

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
  let {default: config} = await Config.import_(path)

  let (theme, themeName) = Theme.getCurrent(config.theme)
  Theme.setEnv(Bun.env, themeName)

  switch config.window {
  | Some(window) => WindowRenderer.render(window)
  | None => ()
  }

  switch config.status {
  | Some(status) => StatusRenderer.render(~theme, ~status)
  | None => ()
  }
}
