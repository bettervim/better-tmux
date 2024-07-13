let getCurrent = (theme: option<string>) => {
  let theme = theme->Option.getOr("catppuccin-mocha")

  let themePalette = BetterTmux.getTheme(theme)->Option.getOr(BetterTmux.fallback)
  (themePalette, theme)
}

@set
external setEnv: (Bun.Env.t, string) => unit = "BETTER_TMUX_THEME"
