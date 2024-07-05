module Env = {
  @set
  external setTheme: (Bun.Env.t, string) => unit = "BETTER_TMUX_THEME"
}

let createRoot = exec => {
  let root: Reconcilier.root = {
    mount: tree => {
      let body = Parser.make(tree)
      exec(body)
    },
  }

  root
}

module Roots = {
  let statusLeft = createRoot(body => Tmux.exec(SetGlobal(StatusLeft(body))))
  let statusRight = createRoot(body => Tmux.exec(SetGlobal(StatusRight(body))))
  let activeWindow = createRoot(body => Tmux.exec(SetGlobal(WindowStatusCurrentFormat(body))))
  let normalWindow = createRoot(body => Tmux.exec(SetGlobal(WindowStatusFormat(body))))
}

type windowType = [
  | #active
  | #normal
]

type windowParams = {
  @as("type") type_: windowType,
  number: string,
  name: string,
}

type window = windowParams => TmuxJsx.element

type config = {
  theme: option<string>,
  statusLeft: option<TmuxJsx.element>,
  statusRight: option<TmuxJsx.element>,
  window: option<window>,
}
type mod = {default: config}

type flags<'value> = {file: 'value}

module Window = {
  let render = (window: window) => {
    Reconcilier.render(
      window({
        type_: #active,
        name: "#W",
        number: "#I",
      }),
      Roots.activeWindow,
    )

    Reconcilier.render(
      window({
        type_: #normal,
        name: "#W",
        number: "#I",
      }),
      Roots.normalWindow,
    )
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

  Env.setTheme(Bun.env, config.theme->Option.getOr("catppuccin-mocha"))

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
