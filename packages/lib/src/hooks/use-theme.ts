import { Theme } from "../types.js"

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

export const catppuccinMocha = {
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

const onedark = {
  foreground: "#abb2bf",
  background: "#282c34",
  primary: "#98c379",
  secondary: "#d19a66",
}

const onedarkDark = {
  foreground: "#abb2bf",
  background: "#000000",
  primary: "#89ca78",
  secondary: "#d19a66",
}

const onelight = {
  foreground: "#6a6a6a",
  background: "#fafafa",
  primary: "#1da912",
  secondary: "#ee9025",
}

const onedarkVivid = {
  foreground: "#abb2bf",
  background: "#282c34",
  primary: "#89ca78",
  secondary: "#d19a66",
}

export function getTheme(theme?: Theme): ThemePalette {
  const selectedTheme = theme || process.env.BETTER_TMUX_THEME || 'catppuccin-mocha'

  switch (selectedTheme) {
    case 'catppuccin-mocha': return catppuccinMocha
    case 'catppuccin-macchiato': return catppuccinMacchiato
    case 'catppuccin-latte': return catppuccinLatte
    case 'catppuccin-frappe': return catppuccinFrappe
    case 'nord': return nord
    case 'dracula': return dracula
    case 'onedark': return onedark
    case 'onelight': return onelight
    case 'onedark-vivid': return onedarkVivid
    case 'onedark-dark': return onedarkDark
  }
}

export const useTheme = getTheme
