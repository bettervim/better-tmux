type ThemePalette = {
  background: string,
  foreground: string,
  primary: string,
  secondary: string,
}


let nord = {
  foreground: "#D8DEE9",
  background: "#2E3440",
  primary: "#94BECE",
  secondary: "#94BECE",
}

let dracula = {
  foreground: "#f8f8f2",
  background: "#282a36",
  primary: "#bd93f9",
  secondary: "#50fa7b",
}

let catppuccinMocha = {
  foreground: "#cdd6f4",
  background: "#282a36",
  primary: "#b1baf7",
  secondary: "#50fa7b",
}

let catppuccinMacchiato = {
  foreground: "#cad3f5",
  background: "#24273a",
  primary: "#b7bdf8",
  secondary: "#50fa7b",
}

let catppuccinFrappe = {
  foreground: "#cad3f5",
  background: "#24273a",
  primary: "#babbf1",
  secondary: "#50fa7b",
}

let catppuccinLatte = {
  foreground: "#4c4f69",
  background: "#dce0e8",
  primary: "#7287fd",
  secondary: "#50fa7b",
}


export function useTheme(): ThemePalette {
  const theme = process.env.BETTER_TMUX_THEME
  console.log(theme)
  switch (theme) {
    case 'catppuccin-mocha': return catppuccinMocha
    case 'catppuccin-macchiato': return catppuccinMacchiato
    case 'catppuccin-latte': return catppuccinLatte
    case 'catppuccin-frappe': return catppuccinFrappe
    case 'nord': return nord
    case 'dracula': return dracula
  }
}
