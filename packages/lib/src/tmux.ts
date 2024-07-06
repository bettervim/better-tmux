const globals = {
  hostname: "#H",
  sessionName: "#S",
  hour_24: '%H',
  hour_12: '%I',
  hour_24_single: '%k',
  hour_12_single: '%l',
  minute: '%M',
  second: '%S',
  am_pm_upper: '%p',
  am_pm_lower: '%P',
}

export const tmux = {
  globals,
} as const
