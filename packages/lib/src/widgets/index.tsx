import { useTheme } from "../hooks/use-theme.js"

export const Hostname = () => {
  const theme = useTheme()

  const hostname = "#H"
  return (
    <box>
      <box padding={1} bg={theme.primary} fg={theme.background}>
        {""}
      </box>
      <box padding={1} bg="#000000" fg={theme.foreground}>
        {hostname}
      </box>
    </box>
  )
}
