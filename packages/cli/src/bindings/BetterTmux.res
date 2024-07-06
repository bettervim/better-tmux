type themePalette = {
  background: string,
  foreground: string,
  primary: string,
  secondary: string,
}

@module("better-tmux")
external themes: Dict.t<themePalette> = "themes"
