let log = (content) => {
  let debugMode = Bun.Env.get(Bun.env, "BETTER_TMUX_DEBUG")
  switch debugMode {
  | Some("1") => Console.log2("[🔎 BetterTmux] Executing Command: ", content)
  | Some(_)
  | None => ()
  }
}
