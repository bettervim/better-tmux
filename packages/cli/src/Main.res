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
type mod = {default: config}

type flags<'value> = {file: 'value}

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
  Reconcilier.render(config.statusLeft, Roots.statusLeft)
  Reconcilier.render(config.statusRight, Roots.statusRight)
}

run()->ignore
