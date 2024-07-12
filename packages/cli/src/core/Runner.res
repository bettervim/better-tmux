@module("../../package.json") external packageJson: {..} = "default"

type flags<'value> = {file: 'value, version: 'value}

let run = async () => {
  let options: flags<BunX.flag> = {
    file: {type_: "string"},
    version: {type_: "boolean"}
  }

  let {values}: BunX.parseArgs<flags<option<string>>> = BunX.parseArgs({
    args: Bun.argv,
    options,
    strict: true,
    allowPositionals: true,
  })

  switch values.file {
  | None => ()
  | Some(file) => {
      let path = Path.resolve([file])
      let {default: config} = await Config.import_(path)
      
      Renderer.render(config)

      switch config.options {
        | None => ()
        | Some(options) => GlobalOptions.execute(options)
      }

      switch config.bindings {
        | None => ()
        | Some(bindings) => Bindings.execute(bindings)
      }
    }
  }

  switch values.version {
    | None => ()
    | Some(_) => Console.log(`better-tmux@${packageJson["version"]} 🚀`)
  }
}
