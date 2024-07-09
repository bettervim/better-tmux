type ThemePalette = {
  background: string,
  foreground: string,
  primary: string,
  secondary: string,
}


const nord = {
  foreground: "#D8DEE9",
  background: "#2E3440",
  primary: "#94BECE",
  secondary: "#94BECE",
}

const dracula = {
  foreground: "#f8f8f2",
  background: "#282a36",
  primary: "#bd93f9",
  secondary: "#50fa7b",
}

const catppuccinMocha = {
  foreground: "#cdd6f4",
  background: "#282a36",
  primary: "#b1baf7",
  secondary: "#50fa7b",
}

const catppuccinMacchiato = {
  foreground: "#cad3f5",
  background: "#24273a",
  primary: "#b7bdf8",
  secondary: "#50fa7b",
}

const catppuccinFrappe = {
  foreground: "#cad3f5",
  background: "#24273a",
  primary: "#babbf1",
  secondary: "#50fa7b",
}

const catppuccinLatte = {
  foreground: "#4c4f69",
  background: "#dce0e8",
  primary: "#7287fd",
  secondary: "#50fa7b",
}


export const themes = {
  "nord": nord,
  "dracula": dracula,
  "catppuccin-latte": catppuccinLatte,
  "catppuccin-mocha": catppuccinMocha,
  "catppuccin-macchiato": catppuccinMacchiato,
  "catppuccin-frappe": catppuccinFrappe
}

export function useTheme(): ThemePalette {
  const theme = process.env.BETTER_TMUX_THEME

  switch (theme) {
    case 'catppuccin-mocha': return catppuccinMocha
    case 'catppuccin-macchiato': return catppuccinMacchiato
    case 'catppuccin-latte': return catppuccinLatte
    case 'catppuccin-frappe': return catppuccinFrappe
    case 'nord': return nord
    case 'dracula': return dracula
  }
}
