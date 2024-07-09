let getCurrent = (theme: option<string>) => {
  let theme = theme->Option.getOr("catppuccin-mocha")

  let themePalette =
    BetterTmux.themes
    ->Dict.get(theme)
    ->Option.getOr(BetterTmux.themes->Dict.getUnsafe("catppuccin-mocha"))

  (themePalette, theme)
}

@set
external setEnv: (Bun.Env.t, string) => unit = "BETTER_TMUX_THEME"
