type themePalette = {
  background: string,
  foreground: string,
  primary: string,
  secondary: string,
}

@module("better-tmux")
external fallback: themePalette = "catppuccinMocha"

@module("better-tmux")
external getTheme: string => option<themePalette> = "getTheme"
